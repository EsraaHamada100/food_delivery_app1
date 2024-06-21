import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/resources/constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  // we need an instance of apiClient as we will get data from it
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});
  Future<Response> getPopularProductList() async {
    return await apiClient
        .getData(AppConstants.popularProductUri);
  }
}
