import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/resources/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});
  void addToCartListLocalStorage(List<CartModel> cartList) {
    List<String> cartStringList = [];
    for (CartModel cart in cartList) {
      cartStringList.add(jsonEncode(cart));
    }
    sharedPreferences.setStringList(AppConstants.userCartList, cartStringList);
  }

  List<CartModel> getCartList() {
    List<String> cartStringList =
        sharedPreferences.getStringList(AppConstants.userCartList) ?? [];
    List<CartModel> cartList = [];
    for (String cart in cartStringList) {
      cartList.add(CartModel.fromJson(jsonDecode(cart)));
    }
    return cartList;
  }

  void clearCartList(){
    sharedPreferences.remove(AppConstants.userCartList);
  }

  void addToHistoryCartListLocalStorage(){
    List<String> cartStringList =
        sharedPreferences.getStringList(AppConstants.userCartList) ?? [];
    List<String> historyCartList = sharedPreferences.getStringList(AppConstants.userCartList) ?? [];
    debugPrint("cart List $cartStringList");
    historyCartList.addAll(cartStringList);
    sharedPreferences.setStringList(AppConstants.userCartHistoryList, historyCartList);
  }

  List<CartModel> getHistoryCartList() {
    List<String> cartStringList =
        sharedPreferences.getStringList(AppConstants.userCartHistoryList) ?? [];
    List<CartModel> historyCartList = [];
    for (String cart in cartStringList) {
      historyCartList.add(CartModel.fromJson(jsonDecode(cart)));
    }
    return historyCartList;
  }
}