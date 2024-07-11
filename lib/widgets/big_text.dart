import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/font_weight_manager.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final TextOverflow overflow;

  const BigText({
    Key? key,
    required this.text,
    // this is the mainBlackColor but I can't but variable here
    this.color = const Color(0xFF332D2B),
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
          color: color,
          fontSize: size != 0 ? size : FontSize.s20,
          fontFamily: FontConstants.fontFamily,
          fontWeight: FontWeightManager.regular),
    );
  }
}
