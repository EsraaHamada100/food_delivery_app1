

import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/resources/app_values.dart';
import 'package:food_delivery_app/resources/color_manager.dart';
import 'package:food_delivery_app/resources/constants.dart';
import 'package:food_delivery_app/resources/strings_manager.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../models/cart_model.dart';
import '../../routes/route_helper.dart';

class CartItemWidget extends StatelessWidget {
  final CartController cartController;
  final CartModel cart;
  const CartItemWidget({required this.cartController,required this.cart, super.key});
  @override
  Widget build(BuildContext context) {
    bool isSnackBarVisible = false;
    return SizedBox(
      width: double.maxFinite,
      height: AppHeight.h100,
      child: Row(
        children: [
          // product image
          GestureDetector(
            onTap: (){
              int popularIndex = Get.find<PopularProductController>().getProductIndex(cart.product);
              if(popularIndex >= 0){
                Get.toNamed(RouteHelper.getPopularFood(pageId: popularIndex, page: AppStrings.cartPage));
              }
              int recommendedIndex = Get.find<RecommendedProductController>().getProductIndex(cart.product);
              if(recommendedIndex >= 0){
                int recommendedIndex = Get.find<RecommendedProductController>().getProductIndex(cart.product);
                Get.toNamed(RouteHelper.getRecommendedFood(pageId: recommendedIndex, page: AppStrings.cartPage));
              }else {
                // I wrote this to not show the snack-bar more than once one the user over clicks on the product
                if(!isSnackBarVisible) {
                  Get.snackbar(
                  "History Product",
                  "This product is not available in the stock",
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                    snackbarStatus: (status) {
                      if (status == SnackbarStatus.CLOSED) {
                        isSnackBarVisible = false;
                      }else if(status == SnackbarStatus.OPENING){
                        isSnackBarVisible = true;
                      }
                    },
                );
                }
              }
            },
            child: Container(
              width: AppWidth.w100,
              height: AppHeight.h100,
              margin: EdgeInsets.only(bottom: AppHeight.h10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s20),
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                      AppConstants.baseUrl +
                          AppConstants.uploadUrl +
                          cart.product.img!,
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SizedBox(width: AppWidth.w10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BigText(
                  text: cart.product.name!,
                  color: Colors.black54,
                ),
                SmallText(text: "Spicy"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(
                      text: "\$ ${cart.product.price}",
                      color: Colors.redAccent,
                    ),
                    Container(
                      padding: EdgeInsets.all(AppSize.s10),
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
                              cartController.addItem(cart.product,
                                  cart.quantity - 1);
                            },
                            child: const Icon(
                              Icons.remove,
                              color: ColorManager.iconColor,
                            ),
                          ),
                          SizedBox(width: AppWidth.w10),
                          // show quantity 
                          BigText(text: cart.quantity.toString()),
            
                          SizedBox(width: AppWidth.w10),
                          // increment quantity number
                          GestureDetector(
                            onTap: () {
            
                              cartController.addItem(cart.product,
                                  cart.quantity + 1);
                            },
                            child: const Icon(
                              Icons.add,
                              color: ColorManager.iconColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
