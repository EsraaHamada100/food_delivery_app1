import 'package:food_delivery_app/models/cart_history_model.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';

// TODO refactor the code to make it more readable
class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  final Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void getStoredCartItems() {
    // cartRepo.clearCartList();
    // cartRepo.clearCartHistoryList();
    List<CartModel> cartList = cartRepo.getCartList();
    if (_items.isEmpty) {
      for (CartModel cartModel in cartList) {
        _items.putIfAbsent(cartModel.id, () => cartModel);
      }
    }
  }

  void addItem(ProductModel product, int quantity) {
    final CartModel cartModel = CartModel(
      id: product.id,
      product: product,
      quantity: quantity,
      isExist: true,
      // time: DateTime.now().toString(),
    );
    if (quantity == 0) {
      // if the items doesn't exist it will return null so no exceptions will be thrown
      _items.remove(product.id);
    } else {
      _items.update(
        product.id,
        (_) => cartModel,
        ifAbsent: () => cartModel,
      );
    }
    cartRepo.addToCartListLocalStorage(_items.values.toList());
    update();
  }

  bool existInCart(ProductModel productModel) {
    if (_items.containsKey(productModel.id)) {
      return true;
    }
    return false;
  }

  int getCartQuantity(ProductModel productModel) {
    int quantity = 0;
    if (_items.containsKey(productModel.id)) {
      CartModel cartModel = items[productModel.id]!;
      quantity = cartModel.quantity;
      // _items.forEach((key, cartModel) {
      //   if (key == productModel.id) {
      //     quantity = cartModel.quantity!;
      //   }
      // });
    }
    return quantity;
  }

  void checkOut(){
    cartRepo.addToCartHistoryListLocalStorage();
    cartRepo.clearCartList();
    _items.clear();
    update();
  }

  List<CartHistoryModel> getCartHistoryList() {
    return cartRepo.getCartHistoryList();
  }

  int get totalItems {
    int totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity;
    });
    return totalQuantity;
  }

  double get totalPrice {
    double total = 0;
    _items.forEach((key, value) {
      total += value.quantity * value.product.price!;
    });
    return total;
  }

  List<CartModel> get getCartItems =>
      _items.entries.map((e) => e.value).toList();
}
