import 'package:food_delivery_app/pages/Home/home_page.dart';
import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:food_delivery_app/pages/food/popular_food_detail.dart';
import 'package:food_delivery_app/pages/food/recommended_food_detail.dart';
import 'package:food_delivery_app/pages/splash/splash_page.dart';
import 'package:get/get.dart';

import '../pages/account/account_page.dart';

class RouteHelper {
  static const String _initial = '/';
  static const String _splashPage = '/splash';
  static const String _popularFood = '/popular-food';
  static const String _recommendedFood = '/recommended-food';
  static const String _cartPage = '/cart-page';
  static const String _accountPage = '/account-page';

  static String getSplashPage() => _splashPage;
  static String getInitial() => _initial;
  static String getPopularFood({required int pageId, String? page}) =>
      '$_popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood({required int pageId, String? page}) =>
      '$_recommendedFood?pageId=$pageId&page=$page';

  static String getCartPage() => _cartPage;
  static String getAccountPage() => _accountPage;

  static List<GetPage> routes = [
    GetPage(name: _splashPage, page: () => const SplashPage()),
    // main food page
    GetPage(name: _initial, page: () => const HomePage()),

    // popular food page
    GetPage(
      name: _popularFood,
      page: () {
        int pageId = int.parse(Get.parameters['pageId']!);
        String? page = Get.parameters['page'];
        return PopularFoodDetails(
          pageId: pageId,
          previousPage: page,
        );
      },
      transition: Transition.fadeIn,
    ),

    // recommended food page
    GetPage(
      name: _recommendedFood,
      page: () {
        int pageId = int.parse(Get.parameters['pageId']!);
        String? page = Get.parameters['page'];
        return RecommendedFoodDetail(
          pageId: pageId,
          previousPage: page,
        );
      },
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: _cartPage,
      page: () {
        return const CartPage();
      },
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: _accountPage,
      page: () {
        return const AccountPage();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
