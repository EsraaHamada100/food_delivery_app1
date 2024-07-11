class SignUpModel {
  String name;
  String email;
  String phone;
  String password;

  SignUpModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  // to Json
  Map<String, dynamic> toJson() {
    return {
      'f_name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }
}
