import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/app_values.dart';
import 'package:food_delivery_app/resources/color_manager.dart';
import 'package:food_delivery_app/resources/font_weight_manager.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color color;
  double size;
  double height;
  int maxLines;
  SmallText({
    Key? key,
    required this.text,
    // this is the mainBlackColor but I can't but variable here
    this.color = ColorManager.lessImportantTextColor,
    this.size = 0,
    this.height = 0,
    this.maxLines = 1000,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size != 0 ? size : FontSize.s12,
        fontFamily: FontConstants.fontFamily,
        height: height != 0 ? height : AppSize.s1_2,
      ),
      textAlign: TextAlign.justify,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
