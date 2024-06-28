import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/cart_history_model.dart';
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

  void addToCartHistoryListLocalStorage(){
    // List<String> cartStringList =
    //     sharedPreferences.getStringList(AppConstants.userCartList) ?? [];
    List<CartModel> cartList = getCartList();
    if(cartList.isEmpty) return;
    CartHistoryModel cartHistory = CartHistoryModel(
      time: DateTime.now(),
      cartList: cartList,
    );
    List<String> cartHistoryList = sharedPreferences.getStringList(AppConstants.userCartHistoryList) ?? [];
    log("history cart  ${jsonEncode(cartHistory.toJson())}");
    cartHistoryList.add(jsonEncode(cartHistory.toJson()));
    sharedPreferences.setStringList(AppConstants.userCartHistoryList, cartHistoryList);
  }

  List<CartHistoryModel> getCartHistoryList() {
    List<String> cartHistoryStringList =
        sharedPreferences.getStringList(AppConstants.userCartHistoryList) ?? [];
    List<CartHistoryModel> cartHistoryList = [];
    for (String cartHistory in cartHistoryStringList) {
      log("Cart History = $cartHistory");
      cartHistoryList.add(CartHistoryModel.fromJson(jsonDecode(cartHistory)));
    }
    return cartHistoryList.reversed.toList();
  }
  void clearCartHistoryList(){
    sharedPreferences.remove(AppConstants.userCartHistoryList);
  }
}