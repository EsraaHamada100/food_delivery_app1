import 'dart:developer';

import 'cart_model.dart';

class CartHistoryModel {
  DateTime time;
  List<CartModel> cartList;
  CartHistoryModel({
    required this.time,
    required this.cartList,
  });
  factory CartHistoryModel.fromJson(Map<String, dynamic> json) {
    log("time = " + json['time']);
    return CartHistoryModel(
      time: DateTime.parse(json['time']),
      cartList: ((json['cart_list']).map<CartModel>((cart) => CartModel.fromJson(cart)).toList() ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time.toString(),
      'cart_list': cartList.map((cart) => cart.toJson()).toList(),
    };
  }

}