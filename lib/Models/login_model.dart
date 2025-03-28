class LoginModel {
  final String phone;
  final String password;
  final String FCMToken;

  LoginModel({
    required this.phone,
    required this.password,
    required this.FCMToken,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': phone,
      'password': password,
    };
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      phone: json['phone'] ?? '',
      password: json['password'] ?? '', 
      FCMToken: json['password'] ?? '',
    );
  }
} 