import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/data/repository/auth_repo.dart';
import 'package:food_delivery_app/models/login_model.dart';
import 'package:food_delivery_app/models/response_model.dart';
import 'package:food_delivery_app/models/sign_up_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});
  late ResponseModel _responseModel;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<ResponseModel> signUp(SignUpModel signUpModel) async {
    _isLoading = true;
    update();
    final response = await authRepo.registration(signUpModel);
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body['token']);
      _responseModel =
          ResponseModel(isSuccess: true, message: response.body['token']);
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

  Future<ResponseModel> login(LoginModel loginModel) async {
    _isLoading = true;
    update();
    final response = await authRepo.login(loginModel);
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body['token']);
      _responseModel =
          ResponseModel(isSuccess: true, message: response.body['token']);
    } else {
      _responseModel = ResponseModel(
          isSuccess: false,
          message: response.statusText ?? "An error happened");
    }
    _isLoading = false;
    update();
    return _responseModel;
  }

  bool userLoggedIn() {
    return authRepo.getUserToken() != null;
  }

  Future<bool> logout()async{
    return await authRepo.removeToken();
  }
}
