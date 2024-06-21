import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/app_values.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  const IconAndTextWidget(
      {required this.icon,
      required this.iconColor,
      required this.text,
      Key? key})
      : super(key: key);
  final IconData icon;
  final Color iconColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: AppSize.s24,
        ),
        SizedBox(width: AppWidth.w5),
        SmallText(text: text),
      ],
    );
  }
}
