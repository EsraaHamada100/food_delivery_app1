
import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/app_values.dart';
import 'package:food_delivery_app/resources/color_manager.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: AppHeight.h100,
        width: AppHeight.h100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s50),
          color: ColorManager.mainColor,
          boxShadow: [
            BoxShadow(
              color: ColorManager.mainColor.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]
        ),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(color: Colors.white,),
      ),
    );
  }
}