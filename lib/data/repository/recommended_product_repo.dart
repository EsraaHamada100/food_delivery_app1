import 'package:food_delivery_app/data/api/api_client.dart';
import 'package:food_delivery_app/resources/constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  // we need an instance of apiClient as we will get data from it
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});
  Future<Response> getRecommendedProductList() async {
    return await apiClient
        .getData(AppConstants.recommendedProductUri);
  }
}
