import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  // late CartController _cartController;
  bool _isLoaded = false;
  // int _quantity = 0;
  // int get quantity => _quantity;
  // int _inCartItem = 0;
  // int get inCartItem => _inCartItem + _quantity;
  // int get inCartItem => _inCartItem;
  List<dynamic> get popularProductList => _popularProductList;
  bool get isLoaded => _isLoaded;
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update(); // setState()
    }
  }

  int getProductIndex(ProductModel product){
    return _popularProductList.indexOf(product);
  }

  // void setQuantity(bool isIncrement) {
  //   if (isIncrement) {
  //     _quantity = checkQuantity(_quantity + 1);
  //   } else {
  //     _quantity = checkQuantity(_quantity - 1);
  //   }
  //   update();
  // }

  // int checkQuantity(int quantity) {
  //   if ((quantity) < AppConstants.minQuantity) {
  //     Get.snackbar(
  //       "Item count",
  //       "You can't reduce more !",
  //       backgroundColor: ColorManager.mainColor,
  //       colorText: Colors.white,
  //     );
  //     return AppConstants.minQuantity;
  //   }
  //   if ((quantity) > AppConstants.maxQuantity) {
  //     Get.snackbar(
  //       "Item count",
  //       "You can't add more !",
  //       backgroundColor: ColorManager.mainColor,
  //       colorText: Colors.white,
  //     );
  //     return AppConstants.maxQuantity;
  //   }
  //   return quantity;
  // }

  // // this returns the number to zero when you go from product to another
  // void initProduct(ProductModel productModel, CartController cartController) {
  //   _quantity = 0;
  //   _inCartItem = 0;
  //   _cartController = cartController;
  //   final bool exist = _cartController.existInCart(productModel);

  //   if (exist) {
  //     _inCartItem = _cartController.getCartQuantity(productModel);
  //     _quantity = _inCartItem;
  //   }

  //   print("The quantity in the cart is " + _inCartItem.toString());
  // }

  // void addItem(ProductModel product) {
  //   // if (_quantity > 0) {
  //   _cartController.addItem(product, _quantity);
  //   // _quantity = 0;
  //   _inCartItem = _cartController.getCartQuantity(product);
  //   _cartController.items.forEach((key, value) {
  //     print("The id is ${value.id}, The quantity is ${value.quantity}");
  //   });
  //   update();
  //   // } else {
  //   //   Get.snackbar(
  //   //     "Item count",
  //   //     "You should at least add an item to the cart",
  //   //     backgroundColor: ColorManager.mainColor,
  //   //     colorText: Colors.white,
  //   //   );
  //   // }
  // }

  // int get totalItems {
  //   return _cartController.totalItems;
  // }

}
