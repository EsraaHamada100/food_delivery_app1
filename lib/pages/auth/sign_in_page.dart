
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/login_model.dart';
import 'package:food_delivery_app/widgets/custom_loader.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../resources/app_values.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_weight_manager.dart';
import '../../routes/route_helper.dart';
import '../../utils/validators.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';
import '../../widgets/error_snack_bar.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  // phone and password controller
  // final TextEditingController phoneController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  final _signInFormKey = GlobalKey<FormState>();
  final _phoneFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  String phone = '';
  String password = '';

  _login() async {
    if (_signInFormKey.currentState!.validate()) {
      final LoginModel loginModel =
          LoginModel(phone: phone, password: password);
      final authController = Get.find<AuthController>();
      authController.login(loginModel).then((responseModel) {
        if (responseModel.isSuccess) {
          Get.toNamed(RouteHelper.getInitial());
        } else {
          GlobalSnackBar.showError("Error", responseModel.message);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s20),
          child: SingleChildScrollView(
            child: GetBuilder<AuthController>(builder: (authController) {
              return authController.isLoading
                  ? const CustomLoader()
                  : Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: AppHeight.h20),
                            child: Center(
                              child: CircleAvatar(
                                radius: AppHeight.h100,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    const AssetImage(ImageAssets.splashImage),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppHeight.h20,
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            child: Text(
                              "Sign in",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                            ),
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            child: Text(
                              "It's time for delicious food",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          SizedBox(
                            height: AppHeight.h10,
                          ),
                          AppTextField(
                              hintText: "Phone",
                              icon: Icons.phone,
                              validator: (value) {
                                value = value?.trim();
                                if (value!.isEmpty) {
                                  return "Please enter your phone number";
                                }
                                phone = value;
                                return null;
                              }),
                          AppTextField(
                              hintText: "Password",
                              isObscure: true,
                              icon: Icons.password,
                              validator: (value) {
                                value = value?.trim();
                                if (value == null || value.isEmpty) {
                                  return "Please enter your password";
                                }
                                password = value;
                                return null;
                              }),
                          SizedBox(height: AppHeight.h30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.mainColor,
                              minimumSize: Size(AppSize.s150, AppSize.s50),
                            ),
                            onPressed: () {
                              _login();
                            },
                            child: BigText(
                              text: "Sign In",
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: AppHeight.h10),
                          RichText(
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: FontSize.s16,
                              ),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.back(),
                                  text: "Sign Up",
                                  style: TextStyle(
                                    color:
                                        ColorManager.mainColor.withOpacity(0.7),
                                    fontSize: FontSize.s16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
            }),
          ),
        ),
      ),
    );
  }
}
