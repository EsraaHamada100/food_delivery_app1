import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controllers/cart_controller.dart';
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependancies.dart' as dp;
import 'routes/route_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize all the dependencies as I put them all in dependencies

  await dp.init();
  Get.config(
    enableLog: true,  // Enable or disable logging
    logWriterCallback: (text, {bool isError = false}) {
      print('GetX Log: $text');
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    Get.find<CartController>().getStoredCartItems();
    print(MediaQuery.of(context).size);
    return ScreenUtilInit(
      designSize: const Size(411.4, 867.4),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // home:  MainFoodPage(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      }
    );
  }
}
