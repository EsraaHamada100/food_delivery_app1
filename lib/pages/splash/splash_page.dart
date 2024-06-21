
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/app_values.dart';
import 'package:food_delivery_app/resources/assets_manager.dart';
import 'package:food_delivery_app/resources/color_manager.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  // Future<void> _loadResources()async {
  //   await Get.find<PopularProductController>().getPopularProductList();
  //   await Get.find<RecommendedProductController>().getRecommendedProductList();
  // }
  @override
  void initState() {
    super.initState();
    // _loadResources();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(const Duration(seconds: 3), ()=> Get.offNamed(RouteHelper.getInitial()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.splashBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ScaleTransition(
              scale: animation,
              child: Center(
                child: Image.asset(
                  ImageAssets.splashImage,
                  width: AppHeight.h300,
                ),
              ),
            ),
            Center(
              child: Image.asset(
                ImageAssets.splashText,
                width: AppHeight.h300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
