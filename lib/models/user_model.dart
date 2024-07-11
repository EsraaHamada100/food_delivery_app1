// UserModel class that has id, name, email, phone, orderCount and has from json function all of them should be required and not null

class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final int orderCount;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.orderCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['f_name'],
      email: json['email'],
      phone: json['phone'],
      orderCount: json['order_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['f_name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['order_count'] = orderCount;
    return data;
  }
}