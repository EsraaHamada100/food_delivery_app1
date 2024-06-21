// we get the data from api send it to repository and the repository send
// the data to controllers which in turn send it to aur UI
import 'package:food_delivery_app/resources/constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{
  String token = AppConstants.token;
  final String appBaseUrl;
  late Map<String, String > _mainHeader;
  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    _mainHeader= {
      'Content_type':'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri) async{
    try{
      Response response = await get(uri);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

}