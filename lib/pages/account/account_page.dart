import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/app_values.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';

import '../../resources/color_manager.dart';
import 'account_field_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  final List<Map<String, dynamic>> data = const [
    {
      "icon": Icons.person,
      "text": "Ahmed",
      "backgroundColor": ColorManager.mainColor
    },
    {
      "icon": Icons.phone,
      "text": "1323256465",
      "backgroundColor": ColorManager.iconsColor1,
    },
    {
      "icon": Icons.email,
      "text": "p5qFP@example.com",
      "backgroundColor": ColorManager.iconsColor1,
    },
    {
      "icon": Icons.location_on,
      "text": "Cairo, Egypt",
      "backgroundColor": ColorManager.iconsColor1,
    },
    {
      "icon": Icons.message,
      "text": "Message",
      "backgroundColor": Colors.red,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.mainColor,
        title: BigText(
          text: "Profile",
          size: AppSize.s24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: AppHeight.h20),
        child: Column(
          children: [
            AppIcon(
              icon: Icons.person,
              backgroundColor: ColorManager.mainColor,
              iconColor: Colors.white,
              size: AppSize.s150,
              iconSize: AppSize.s70,
            ),
            SizedBox(height: AppHeight.h20),
            // show the things in the list
            Expanded(
                child: ListView(
              children: data
                  .map(
                    (e) => AccountFieldWidget(
                        iconData: e['icon'],
                        text: e['text'],
                        iconBackgroundColor: e['backgroundColor']),
                  )
                  .toList(),
            )),
          ],
        ),
      ),
    );
  }
}
