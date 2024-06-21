import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/product_controller.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:get/get.dart';

import '../resources/color_manager.dart';
import 'app_icon.dart';
import 'big_text.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});
  // final ProductController productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
            Get.toNamed(RouteHelper.getCartPage());
        },
        child: Stack(
          children: [
            const AppIcon(icon: Icons.shopping_cart_outlined),
            if (controller.totalItems > 0) ...{
              const Positioned(
                top: 0,
                right: 0,
                child: AppIcon(
                  icon: Icons.circle,
                  iconColor: Colors.transparent,
                  backgroundColor: ColorManager.mainColor,
                  size: 20,
                ),
              ),
              Positioned(
                top: 3,
                right: 6,
                child: BigText(
                  text: "${controller.totalItems}",
                  size: 12,
                  color: Colors.white,
                ),
              ),
            }
          ],
        ),
      );
    });
  }
}
