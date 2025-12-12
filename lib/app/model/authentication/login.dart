import 'dart:convert';
class UserLoginModel {
    final String email;
    final String password;

    UserLoginModel({
        required this.email,
        required this.password,
    });

    UserLoginModel copyWith({
        String? email,
        String? password,
    }) => 
        UserLoginModel(
            email: email ?? this.email,
            password: password ?? this.password,
        );

    factory UserLoginModel.fromRawJson(String str) => UserLoginModel.fromJson(json.decode(str));
    String toRawJson() => json.encode(toJson());

    factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
