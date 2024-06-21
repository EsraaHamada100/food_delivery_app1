import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';
import '../resources/color_manager.dart';
import '../resources/constants.dart';
import 'cart_controller.dart';

class ProductController extends GetxController{

  late CartController _cartController;
  
  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItem = 0;
  int get inCartItem => _inCartItem;

  
  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((quantity) < AppConstants.minQuantity) {
      Get.snackbar(
        "Item count",
        "You can't reduce more !",
        backgroundColor: ColorManager.mainColor,
        colorText: Colors.white,
      );
      return AppConstants.minQuantity;
    }
    if ((quantity) > AppConstants.maxQuantity) {
      Get.snackbar(
        "Item count",
        "You can't add more !",
        backgroundColor: ColorManager.mainColor,
        colorText: Colors.white,
      );
      return AppConstants.maxQuantity;
    }
    return quantity;
  }

  // this returns the number to zero when you go from product to another
  void initProduct(ProductModel productModel, CartController cartController) {
    _quantity = 0;
    _inCartItem = 0;
    _cartController = cartController;
    final bool exist = _cartController.existInCart(productModel);

    if (exist) {
      _inCartItem = _cartController.getCartQuantity(productModel);
      _quantity = _inCartItem;
    }

    // print("The quantity in the cart is " + _inCartItem.toString());
  }

  void addItem(ProductModel product) {
    // if (_quantity > 0) {
    _cartController.addItem(product, _quantity);
    // _quantity = 0;
    _inCartItem = _cartController.getCartQuantity(product);
    update();
    _cartController.items.forEach((key, value) {
      print("The id is ${value.id}, The quantity is ${value.quantity}");
    });
    // } else {
    //   Get.snackbar(
    //     "Item count",
    //     "You should at least add an item to the cart",
    //     backgroundColor: ColorManager.mainColor,
    //     colorText: Colors.white,
    //   );
    // }
  }

  int get totalItems {
    return _cartController.totalItems;
  }

  // List<CartModel> get getCartItems => _cartController.getCartItems;


}