import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/models/sign_up_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/login_model.dart';
import '../../resources/constants.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpModel signUpModel) async{
    return await apiClient.postData(AppConstants.registrationUrl, signUpModel.toJson());
  }
  Future<Response> login(LoginModel loginModel) async{
    return await apiClient.postData(AppConstants.loginUrl, loginModel.toJson());
  }
  saveUserToken(String token) async{
    apiClient.token = token;
    return await sharedPreferences.setString(AppConstants.token, token);
  }

  String? getUserToken() {
    return sharedPreferences.getString(AppConstants.token);
  }

  Future<bool> removeToken()async{
    apiClient.token = '';
    return await sharedPreferences.remove(AppConstants.token);
  }
}