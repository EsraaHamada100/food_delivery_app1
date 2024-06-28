import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/models/cart_history_model.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/resources/app_values.dart';
import 'package:food_delivery_app/resources/color_manager.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../resources/constants.dart';
import '../../routes/route_helper.dart';
import '../../widgets/big_text.dart';

class CartHistoryPage extends StatelessWidget {
  const CartHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<CartHistoryModel> cartHistoryList =
        Get.find<CartController>().getCartHistoryList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _topBar(),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: AppHeight.h20,
                  left: AppWidth.w20,
                  right: AppWidth.w20,
                ),
                child: cartHistoryList.isEmpty?Center(child: BigText(text: "You don't have any order yet!")):MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    itemCount: cartHistoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      List<CartModel> cartList =
                          cartHistoryList[index].cartList;
                      String parsedDate = DateFormat('yyyy-MM-dd HH:mm a')
                          .format(cartHistoryList[index].time);
                      return Container(
                        height: AppHeight.h120,
                        margin: EdgeInsets.only(bottom: AppHeight.h20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: parsedDate),
                            SizedBox(height: AppHeight.h10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _imageList(cartList),
                                SizedBox(width: AppWidth.w20),
                                _info(cartList),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return Container(
      height: AppHeight.h80,
      color: ColorManager.mainColor,
      width: double.maxFinite,
      padding: EdgeInsets.only(
          top: AppSize.s20, right: AppSize.s5, left: AppSize.s10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BigText(text: "Cart History", color: Colors.white),
          const AppIcon(
            icon: Icons.shopping_cart_outlined,
            iconColor: Colors.black,
            backgroundColor: ColorManager.buttonBackgroundColor,
          ),
        ],
      ),
    );
  }

  Widget _imageList(List<CartModel> cartList) {
    return Wrap(
      spacing: AppWidth.w10,
      children: List.generate(
        3,
        (index) {
          return index < cartList.length
              ? _imageContainer(cartList[index].product.img!)
              : Container();
        },
      ),
    );
  }

  Widget _imageContainer(imageUrl) {
    return Container(
      width: AppHeight.h80,
      height: AppHeight.h80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: NetworkImage(
                AppConstants.baseUrl + AppConstants.uploadUrl + imageUrl),
            fit: BoxFit.cover),
      ),
    );
  }

  Widget _info(List<CartModel> cartList){
    return SizedBox(
      height: AppHeight.h80,
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SmallText(
            text: "total",
            color: ColorManager.titleColor,
          ),
          BigText(
            text:
            "${cartList.length} ${cartList.length > 1 ? "items" : "item"}",
            color: ColorManager.titleColor,
          ),
          GestureDetector(
            onTap: (){
              for(CartModel cartItem in cartList){
                Get.find<CartController>().addItem(cartItem.product, cartItem.quantity);
              }
              Get.toNamed(RouteHelper.getCartPage());
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.s5,
                  vertical: AppSize.s5),
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(AppSize.s5),
                border: Border.all(
                    width: 1,
                    color: ColorManager.mainColor),
              ),
              child: SmallText(
                text: "one more",
                color: ColorManager.mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
