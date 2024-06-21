import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/app_values.dart';
import 'package:food_delivery_app/resources/color_manager.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double size;

  const AppIcon({
    Key? key,
    required this.icon,
    this.iconColor = ColorManager.iconColor,
    this.backgroundColor = ColorManager.iconBackgroundColor,
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size == 0?AppSize.s40: size,
      height: size == 0?AppSize.s40: size,
      decoration: BoxDecoration(
        // size ÷ 2  --> will make a circle
        borderRadius: BorderRadius.circular((size == 0?AppSize.s40:size)/2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: AppSize.s16,
      ),
    );
  }
}
