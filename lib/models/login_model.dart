class LoginModel {
  String phone;
  String password;

  LoginModel({
    required this.phone,
    required this.password,
  });

  // to Json
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
    };
  }
}