import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/app_values.dart';
import 'package:food_delivery_app/resources/color_manager.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final String? Function(String?) validator;
  final bool? isObscure;
  const AppTextField(
      {required this.hintText,
      required this.icon,
      required this.validator,
      this.isObscure,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: AppSize.s15),
          color: Colors.white,
          child: TextFormField(
            obscureText: isObscure ?? false,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(
                icon,
                color: ColorManager.mainColor,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s5),
                borderSide: BorderSide(
                  color: ColorManager.mainColor,
                  width: AppSize.s1_2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s5),
                borderSide: BorderSide(
                  color: ColorManager.mainColor,
                  width: AppSize.s1_2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
