import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/data/repository/auth_repo.dart';
import 'package:food_delivery_app/data/repository/user_repo.dart';
import 'package:food_delivery_app/models/login_model.dart';
import 'package:food_delivery_app/models/response_model.dart';
import 'package:food_delivery_app/models/sign_up_model.dart';
import 'package:food_delivery_app/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepo userRepo;
  UserController({required this.userRepo});
  late ResponseModel _responseModel;

  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<ResponseModel> getUserInfo() async {
    _isLoading = true;
    update();
    final response = await userRepo.getUserInfo();
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _responseModel = ResponseModel(
        isSuccess: true,
        message: "Get user info successfully",
      );
    } else {
      debugPrint(response.statusText);
      _responseModel = ResponseModel(
          isSuccess: false,
          message: response.statusText ?? "An error happened");
    }
    _isLoading = false;
    update();
    return _responseModel;
  }
}
