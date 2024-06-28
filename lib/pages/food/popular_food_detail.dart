import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/product_controller.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/resources/app_values.dart';
import 'package:food_delivery_app/resources/color_manager.dart';
import 'package:food_delivery_app/resources/constants.dart';
import 'package:food_delivery_app/resources/font_weight_manager.dart';
import 'package:food_delivery_app/resources/strings_manager.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/shopping_cart.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/expandable_text_widget.dart';
import '../../widgets/food_details_column.dart';

class PopularFoodDetails extends StatelessWidget {
  final int pageId;
  final String? previousPage;
  const PopularFoodDetails({
    Key? key,
    required this.pageId,
    this.previousPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();
    final PopularProductController popularProductController =
        Get.find<PopularProductController>();
    final ProductModel product =
        popularProductController.popularProductList[pageId];
    productController.initProduct(product, Get.find<CartController>());
    return Scaffold(
      // the page background color
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // big image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: AppHeight.h350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      AppConstants.baseUrl +
                          AppConstants.uploadUrl +
                          product.img!,
                    ),
                  ),
                ),
              ),
            ),
            // icons that appear in the image
            Positioned(
              left: AppWidth.w20,
              right: AppWidth.w20,
              top: AppHeight.h45,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if(previousPage == AppStrings.cartPage){
                          Get.toNamed(RouteHelper.getCartPage());
                        }else {
                          Get.toNamed(RouteHelper.getInitial());
                        }
                      },
                      child: const AppIcon(icon: Icons.arrow_back_ios),
                    ),
                    const ShoppingCart(),

                    // Stack(
                    //   children: [
                    //     const AppIcon(icon: Icons.shopping_cart_outlined),
                    //     if (productController.totalItems > 0) ...{
                    //       const Positioned(
                    //         top: 0,
                    //         right: 0,
                    //         child: AppIcon(
                    //           icon: Icons.circle,
                    //           iconColor: Colors.transparent,
                    //           backgroundColor: ColorManager.mainColor,
                    //           size: 20,
                    //         ),
                    //       ),
                    //       Positioned(
                    //         top: 3,
                    //         right: 6,
                    //         child: GetBuilder<ProductController>(
                    //           builder: (_) {
                    //             return BigText(
                    //               text: "${productController.totalItems}",
                    //               size: 12,
                    //               color: Colors.white,
                    //             );
                    //           }
                    //         ),
                    //       ),
                    //     }
                    //   ],
                    // ),
                  ]),
            ),
            Positioned(
              left: 0,
              right: 0,
              // we make it down the image put we minus 20 because we want it to
              // come on the image a little bit
              top: AppHeight.h350 - AppHeight.h20,
              bottom: 0, // to let the container take all the available size
              child: Container(
                padding: EdgeInsets.only(
                  left: AppWidth.w20,
                  right: AppWidth.w20,
                  top: AppHeight.h20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s20),
                    topRight: Radius.circular(AppSize.s20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoodDetailsColumn(
                      text: product.name!,
                      textSize: FontSize.s26,
                    ),
                    SizedBox(height: AppHeight.h20),
                    BigText(text: "Introduce"),
                    SizedBox(height: AppHeight.h20),
                    Expanded(
                      child: ExpandableTextWidget(text: product.description!),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: AppHeight.h120,
        padding: EdgeInsets.all(AppSize.s20),
        decoration: BoxDecoration(
          color: ColorManager.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s40),
            topRight: Radius.circular(AppSize.s40),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(AppSize.s20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // reduce quantity number
                  GestureDetector(
                    onTap: () {
                      productController.setQuantity(false);
                    },
                    child: const Icon(
                      Icons.remove,
                      color: ColorManager.iconColor,
                    ),
                  ),
                  SizedBox(width: AppWidth.w10),
                  // quantity + inCart item
                  GetBuilder<ProductController>(builder: (_) {
                    return BigText(text: productController.quantity.toString());
                  }),
                  SizedBox(width: AppWidth.w10),
                  // increment quantity number
                  GestureDetector(
                    onTap: () {
                      productController.setQuantity(true);
                    },
                    child: const Icon(
                      Icons.add,
                      color: ColorManager.iconColor,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                productController.addItem(product);
              },
              child: Container(
                padding: EdgeInsets.all(AppSize.s20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s20),
                  color: ColorManager.mainColor,
                ),
                child: BigText(
                  text: "\$ ${product.price} | Add to chart",
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
