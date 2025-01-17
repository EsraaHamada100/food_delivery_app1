// we get the data from api send it to repository and the repository send
// the data to controllers which in turn send it to aur UI
import 'package:food_delivery_app/resources/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService{


  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  late String token;
  late Map<String, String > _mainHeader;
  ApiClient({required this.appBaseUrl, required this.sharedPreferences}){
    baseUrl = appBaseUrl;
    token = sharedPreferences.getString(AppConstants.token) ?? "";
    print("token: $token");
    timeout = const Duration(seconds: 30);
    _mainHeader= {
      'Content_type':'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async{
    try{
      Response response = await get(uri, headers: _mainHeader);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async{
    try{
      Response response = await post(uri, body, headers: _mainHeader);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

}