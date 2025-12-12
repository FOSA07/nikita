import 'dart:convert';

class CreateUserModel {
    final String name;
    final String surname;
    final String email;
    final String password;
    final String confirmPassword;
    final bool termsAccepted;

    CreateUserModel({
        required this.name,
        required this.surname,
        required this.email,
        required this.password,
        required this.confirmPassword,
        required this.termsAccepted,
    });

    CreateUserModel copyWith({
        String? name,
        String? surname,
        String? email,
        String? password,
        String? confirmPassword,
        bool? termsAccepted,
    }) => 
        CreateUserModel(
            name: name ?? this.name,
            surname: surname ?? this.surname,
            email: email ?? this.email,
            password: password ?? this.password,
            confirmPassword: confirmPassword ?? this.confirmPassword,
            termsAccepted: termsAccepted ?? this.termsAccepted,
        );

    factory CreateUserModel.fromRawJson(String str) => CreateUserModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CreateUserModel.fromJson(Map<String, dynamic> json) => CreateUserModel(
        name: json["name"],
        surname: json["surname"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        termsAccepted: json["terms_accepted"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
        "terms_accepted": termsAccepted,
    };
}
