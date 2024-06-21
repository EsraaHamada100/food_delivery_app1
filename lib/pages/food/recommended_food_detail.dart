import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/resources/app_values.dart';
import 'package:food_delivery_app/resources/color_manager.dart';
import 'package:food_delivery_app/resources/constants.dart';
import 'package:food_delivery_app/resources/font_weight_manager.dart';
import 'package:food_delivery_app/resources/strings_manager.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/shopping_cart.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  final String? previousPage;
  const RecommendedFoodDetail({Key? key, required this.pageId,  this.previousPage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();
    // final CartController cartController = Get.find<CartController>();
    final ProductModel product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    productController
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              // to stop it from showing the return back button
              automaticallyImplyLeading: false,
              // this will appear in the middle of the appBar even after you scroll
              // if you used pinned property as true
              toolbarHeight: AppHeight.h80,
              title: Row(
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
                    child: const AppIcon(icon: Icons.clear),
                  ),
                  const ShoppingCart(),
                  // const AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              ),
              // this allow you to add any widget to the bottom of your appBar
              // and it will not disappear when you scroll if you use pinned = true
              bottom: PreferredSize(
                // that is the real size of appBar that will appear after scrolling
                preferredSize: Size.fromHeight(AppHeight.h20),
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    top: AppPadding.p5,
                    bottom: AppPadding.p10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppRadius.r15),
                        topRight: Radius.circular(AppRadius.r15),
                      )),
                  child: Center(
                    child: BigText(text: product.name!, size: FontSize.s26),
                  ),
                ),
              ),
              // to pin an appBar background color and not making the appBar disappear
              // completely note that the image will disapear and the height of appBar
              // will decrease but there will still the background color thanks to
              // pin propriety
              pinned: true,
              backgroundColor: ColorManager.yellowColor,
              // I use this to expend the height of app bar to take more than
              // the normal app bar height
              expandedHeight: AppHeight.h300,
              // I use this to add my image to the app bar
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.baseUrl + AppConstants.uploadUrl + product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: ExpandableTextWidget(
                  text: product.description!,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        // we do that because if we don't the column will take the whole page height
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p50,
              vertical: AppPadding.p10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    productController.setQuantity(false);
                  },
                  child: const AppIcon(
                    iconColor: Colors.white,
                    backgroundColor: ColorManager.mainColor,
                    icon: Icons.remove,
                  ),
                ),
                GetBuilder<ProductController>(
                  builder: (_) {
                    return BigText(
                      text: "\$ ${product.price}  X  ${productController.quantity}",
                      color: ColorManager.mainBlackColor,
                      size: FontSize.s22,
                    );
                  }
                ),
                GestureDetector(
                  onTap: () {
                    productController.setQuantity(true);
                  },
                  child: const AppIcon(
                    iconColor: Colors.white,
                    backgroundColor: ColorManager.mainColor,
                    icon: Icons.add,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: AppHeight.h120,
            padding: EdgeInsets.all(AppPadding.p20),
            decoration: BoxDecoration(
              color: ColorManager.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppRadius.r40),
                topRight: Radius.circular(AppRadius.r40),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(AppPadding.p20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.r20),
                    color: Colors.white,
                  ),
                  child:
                      const Icon(Icons.favorite, color: ColorManager.mainColor),
                ),
                GestureDetector(
                  onTap: (){
                    productController.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.all(AppPadding.p20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadius.r20),
                      color: ColorManager.mainColor,
                    ),
                    child: GetBuilder<ProductController>(builder: (context) {
                      return BigText(
                        text: "\$ ${product.price} add to chart",
                        color: Colors.white,
                      );
                    }),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
