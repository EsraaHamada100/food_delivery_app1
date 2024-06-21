
import 'package:flutter/material.dart';

import '../resources/app_values.dart';
import '../resources/color_manager.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';
import 'small_text.dart';

class FoodDetailsColumn extends StatelessWidget {
  final String text;
  final double textSize;
  // I can't put here a dynamic value so I put 0 and I will check for
  // it in the code inside
  const FoodDetailsColumn({Key? key, required this.text, this.textSize = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // inside this widget he will check if the size is 0 he will assign
        // FontSize.s20 to it else he will assign the given size
        BigText(text: text, size: textSize,),
        SizedBox(height: AppHeight.h10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                    (index) => Icon(
                  Icons.star,
                  color: ColorManager.mainColor,
                  size: AppSize.s15,
                ),
              ),
            ),
            SizedBox(width: AppWidth.w10),
            SmallText(text: "4.5"),
            SizedBox(width: AppWidth.w10),
            SmallText(text: "1287 comments"),
          ],
        ),
        SizedBox(height: AppHeight.h20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.circle,
              iconColor: ColorManager.iconsColor1,
              text: "Normal",
            ),
            IconAndTextWidget(
              icon: Icons.location_on,
              iconColor: ColorManager.mainColor,
              text: "1.7km",
            ),
            IconAndTextWidget(
              icon: Icons.access_time,
              iconColor: ColorManager.iconsColor2,
              text: "32min",
            ),
          ],
        ),
      ],
    );
  }
}
