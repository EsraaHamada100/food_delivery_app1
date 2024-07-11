import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/app_values.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';

class AccountFieldWidget extends StatelessWidget {
  final IconData iconData;
  final Color iconBackgroundColor;
  final String text;
  final void Function()? onTap;
  const AccountFieldWidget(
      {required this.iconData,
      required this.iconBackgroundColor,
      required this.text,
        this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppSize.s15),
        margin: EdgeInsets.all(AppSize.s10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.s10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 1,
              offset: const Offset(0, 2), // changes position of shadow
            )
          ],
        ),
        child: Row(
          children: [
            AppIcon(icon: iconData, backgroundColor: iconBackgroundColor, iconColor: Colors.white, size: AppSize.s40, iconSize: AppSize.s24,),
            SizedBox(width: AppWidth.w10),
            BigText(text: text),
          ],
        ),
      ),
    );
  }
}
