import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/pages/cart/cart_item_widget.dart';
import 'package:food_delivery_app/resources/app_values.dart';
import 'package:food_delivery_app/resources/color_manager.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../models/cart_model.dart';
import '../../routes/route_helper.dart';
import '../../widgets/app_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  // final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            topIconButtons(),
            Positioned(
              top: AppHeight.h100,
              left: AppWidth.w20,
              right: AppWidth.w20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: AppHeight.h15),
                // we will remove the padding in the top for the list widget because it's added automatically
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(
                    builder: (cartController) {
                      List<CartModel> cartList = cartController.getCartItems;
                      return cartList.isNotEmpty
                          ? ListView.builder(
                              itemCount: cartList.length,
                              itemBuilder: (_, index) {
                                return CartItemWidget(cartController: cartController, cart: cartList[index]);
                              })
                          : Center(child: BigText(text: "Cart is Empty"));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
      bottomNavigationBar: Container(
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidth.w10),
                child: GetBuilder<CartController>(builder: (cartController) {
                  return BigText(text: "\$ ${cartController.totalPrice}");
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                cartController.checkOut();
              },
              child: Container(
                padding: EdgeInsets.all(AppPadding.p20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.r20),
                  color: ColorManager.mainColor,
                ),
                child: BigText(
                  text: "Check out",
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topIconButtons() {
    return Positioned(
      top: AppHeight.h60,
      left: AppWidth.w20,
      right: AppWidth.w20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getInitial());
            },
            child: const AppIcon(
              icon: Icons.arrow_back_ios,
              iconColor: Colors.white,
              backgroundColor: ColorManager.mainColor,
            ),
          ),
          SizedBox(width: AppWidth.w100),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getInitial());
            },
            child: const AppIcon(
              icon: Icons.home_outlined,
              iconColor: Colors.white,
              backgroundColor: ColorManager.mainColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getInitial());
            },
            child: const AppIcon(
              icon: Icons.shopping_cart,
              iconColor: Colors.white,
              backgroundColor: ColorManager.mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
