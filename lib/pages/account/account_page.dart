import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/controllers/user_controller.dart';
import 'package:food_delivery_app/resources/app_values.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/custom_loader.dart';
import 'package:get/get.dart';

import '../../resources/color_manager.dart';
import 'account_field_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  @override
  Widget build(BuildContext context) {
    bool userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
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
      body: GetBuilder<UserController>(builder: (userController) {
        // if (!userLoggedIn) {
        //   return const Center(
        //     child: BigText(text: "You must be logged in"),
        //   );
        // }
        // if (userController.isLoading) {
        //   return const CustomLoader();
        // }
        return Container(
          color: ColorManager.mainColor,
          child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(top: AppHeight.h10),
              padding: EdgeInsets.only(top: AppHeight.h20),
              // add redius to the container
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s30),
                  topRight: Radius.circular(AppSize.s30),
                ),
              ),
              child: userLoggedIn
                  ? (userController.isLoading
                      ? const CustomLoader()
                      : Column(
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
                                child: ListView(children: [
                              AccountFieldWidget(
                                iconData: Icons.person,
                                text: userController.userModel.name,
                                iconBackgroundColor: ColorManager.mainColor,
                              ),
                              AccountFieldWidget(
                                iconData: Icons.phone,
                                text: userController.userModel.phone,
                                iconBackgroundColor: ColorManager.iconsColor1,
                              ),
                              AccountFieldWidget(
                                iconData: Icons.email,
                                text: userController.userModel.email,
                                iconBackgroundColor: ColorManager.iconsColor1,
                              ),
                              const AccountFieldWidget(
                                iconData: Icons.location_on,
                                text: "Cairo, Egypt",
                                iconBackgroundColor: ColorManager.iconsColor1,
                              ),
                              const AccountFieldWidget(
                                iconData: Icons.message,
                                text: "Messages",
                                iconBackgroundColor: Colors.red,
                              ),
                              AccountFieldWidget(
                                iconData: Icons.logout,
                                text: "Logout",
                                iconBackgroundColor: ColorManager.iconsColor1,
                                onTap: () {
                                  Get.find<AuthController>().logout();
                                  Get.offNamed(RouteHelper.getSignInPage());
                                },
                              ),
                            ])),
                          ],
                        ))
                  : const Center(
                      child: BigText(text: "You must be logged in"),
                    )),
        );
      }),
    );
  }
}
