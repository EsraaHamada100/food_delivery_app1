// injection of dependencies

import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/data/repository/cart_repo.dart';
import 'package:food_delivery_app/data/repository/recommended_product_repo.dart';
import 'package:food_delivery_app/data/repository/user_repo.dart';
import 'package:food_delivery_app/resources/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/auth_controller.dart';
import '../controllers/user_controller.dart';
import '../data/repository/auth_repo.dart';
import '../data/repository/popular_product_repo.dart';

Future<void> init() async {
  /* local storage */
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  /* api client */
  Get.lazyPut(
    () => ApiClient(
      appBaseUrl: AppConstants.baseUrl,
      sharedPreferences: Get.find(),
    ),
  );

  /* repos */

  // I make Get.find I provide the apiClient class above so he hase it and
  // will search for it
  // auth repo
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: sharedPreferences),fenix: true);
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: sharedPreferences));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));

  /* controllers */

  // sign up controller
  Get.lazyPut<AuthController>(() => AuthController(authRepo: Get.find()),fenix: true);
  Get.lazyPut<UserController>(() => UserController(userRepo: Get.find()),fenix: true);
  Get.lazyPut<ProductController>(() => ProductController(), fenix: true);
  Get.lazyPut<PopularProductController>(
      () => PopularProductController(popularProductRepo: Get.find()),
      fenix: true);
  Get.lazyPut<RecommendedProductController>(
      () => RecommendedProductController(recommendedProductRepo: Get.find()),
      fenix: true);
  Get.lazyPut<CartController>(() => CartController(cartRepo: Get.find()),
      fenix: true);
}
