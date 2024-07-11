
class AppConstants{
  static const String appName = "Food delivery";
  static const int appVersion = 1;

  // static const String baseUrl = 'http://mvs.bslmeiyu.com';
  static const String baseUrl = 'http://127.0.0.1:8000';
  static const String registrationUrl = '/api/v1/auth/register';
  static const String loginUrl = '/api/v1/auth/login';
  static const String userInfoUrl = '/api/v1/customer/info';
  static const String popularProductUri = '/api/v1/products/popular';
  static const String recommendedProductUri = '/api/v1/products/recommended';

  static const String token = "";
  static const String uploadUrl = "/uploads/";

  static const int maxQuantity = 20;
  static const int minQuantity = 0;

  // shared preferences keys
  static const String userCartList = 'userCartList';
  static const String userCartHistoryList = 'userCartHistoryList';

}