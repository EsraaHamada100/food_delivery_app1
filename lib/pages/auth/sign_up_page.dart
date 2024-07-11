import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/models/sign_up_model.dart';
import 'package:food_delivery_app/resources/assets_manager.dart';
import 'package:food_delivery_app/resources/color_manager.dart';
import 'package:food_delivery_app/resources/font_weight_manager.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/widgets/app_text_field.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/custom_loader.dart';
import 'package:food_delivery_app/widgets/error_snack_bar.dart';
import 'package:get/get.dart';

import '../../resources/app_values.dart';
import '../../utils/validators.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  // form key
  static final _formKey = GlobalKey<FormState>();


  String _name = '';
  String _email = '';
  String _password = '';
  String _phone = '';
  final List<FaIcon> icons = [
    FaIcon(
      FontAwesomeIcons.facebook,
      color: Colors.blue,
      size: AppSize.s50,
    ),
    FaIcon(
      FontAwesomeIcons.google,
      color: Colors.black,
      size: AppSize.s50,
    ),
    FaIcon(
      FontAwesomeIcons.twitter,
      color: Colors.blueAccent,
      size: AppSize.s50,
    ),
  ];

  _register() async {
    if (_formKey.currentState!.validate()) {
      final signUpData = SignUpModel(
          name: _name, email: _email, phone: _phone, password: _password);

      final AuthController authController = Get.find<AuthController>();
      authController.signUp(signUpData).then((responseModel) {
        if (responseModel.isSuccess) {
          Get.offNamed(RouteHelper.getInitial());
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
          child: GetBuilder<AuthController>(builder: (authController) {
            return authController.isLoading
                ? const CustomLoader()
                : SingleChildScrollView(
                    child: Form(
                      key: _formKey,
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
                          AppTextField(
                              hintText: "Name",
                              icon: Icons.person,
                              validator: (value) {
                                value = value?.trim();
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                _name = value;
                                return null;
                              }),
                          AppTextField(
                              hintText: "Email",
                              icon: Icons.email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!isValidEmail(value)) {
                                  return 'Please enter a valid email';
                                }
                                _email = value;
                                return null;
                              }),
                          AppTextField(
                              hintText: "Password",
                              isObscure: true,
                              icon: Icons.password,
                              validator: (value) {
                                value = value?.trim();
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (!isValidPassword(value)) {
                                  return 'Password must be at least 6 characters';
                                }
                                _password = value;
                                return null;
                              }),
                          AppTextField(
                              hintText: "Phone",
                              icon: Icons.phone,
                              validator: (value) {
                                value = value?.trim();
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone';
                                }
                                _phone = value;
                                return null;
                              }),
                          SizedBox(height: AppHeight.h30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.mainColor,
                              minimumSize: Size(AppSize.s150, AppSize.s50),
                            ),
                            onPressed: _register,
                            child: BigText(
                              text: "Sign Up",
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: AppHeight.h10),
                          _orLine(),
                          SizedBox(height: AppHeight.h10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(onPressed: () {}, icon: icons[0]),
                              IconButton(onPressed: () {}, icon: icons[1]),
                              IconButton(onPressed: () {}, icon: icons[2]),
                            ],
                          ),
                          SizedBox(height: AppHeight.h10),
                          RichText(
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: FontSize.s16,
                              ),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.toNamed(
                                        RouteHelper.getSignInPage()),
                                  text: "Sign In",
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
                    ),
                  );
          }),
        ),
      ),
    );
  }

  _orLine() {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Divider(),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppSize.s10, vertical: AppSize.s5),
          decoration: BoxDecoration(
            color: Colors.white,
            // make a gery border
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(AppSize.s5),
          ),
          child: const Text(
            'OR',
            style: TextStyle(
              color: ColorManager.mainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
