import 'dart:convert';

import 'package:food_delivery_app/models/products_model.dart';

class CartModel {
  late int id;
  ProductModel product;
  // String? name;
  // double? price;
  // String? img;
  int quantity;
  late bool isExist;
  String? time;
  CartModel({
    required this.id,
    required this.product,
    // required this.name,
    // required this.price,
    // required this.img,
    required this.quantity,
    required this.isExist,
    this.time,
  });
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: int.parse(json['id']),
      product: ProductModel.fromJson(json['product']),
      // name: json['name'];
      // price: json['price'].toDouble();
      // img: json['img'];
      quantity: int.parse(json['quantity']),
      isExist: json['isExist'],
      time: json['time'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'product': product.toJson(),
      'quantity': quantity.toString(),
      'isExist': isExist,
      'time': time,
    };
  }
}
