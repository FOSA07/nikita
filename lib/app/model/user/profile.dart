import 'dart:convert';

class UserLoggedInModel {
    final User user;
    final String token;

    UserLoggedInModel({
        required this.user,
        required this.token,
    });

    UserLoggedInModel copyWith({
        User? user,
        String? token,
    }) => 
        UserLoggedInModel(
            user: user ?? this.user,
            token: token ?? this.token,
        );

    factory UserLoggedInModel.fromJson(String str) => UserLoggedInModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserLoggedInModel.fromMap(Map<String, dynamic> json) => UserLoggedInModel(
        user: User.fromMap(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "token": token,
    };
}

class User {
    final String id;
    final String name;
    final String surname;
    final String email;
    final dynamic emailVerifiedAt;
    final String role;
    final String password;
    final int status;
    final dynamic lastLoginAt;
    final dynamic lastLoginIp;
    final bool termsAccepted;
    final dynamic rememberToken;
    final dynamic createdAt;
    final dynamic updatedAt;

    User({
        required this.id,
        required this.name,
        required this.surname,
        required this.email,
        required this.emailVerifiedAt,
        required this.role,
        required this.password,
        required this.status,
        required this.lastLoginAt,
        required this.lastLoginIp,
        required this.termsAccepted,
        required this.rememberToken,
        required this.createdAt,
        required this.updatedAt,
    });

    User copyWith({
        String? id,
        String? name,
        String? surname,
        String? email,
        dynamic emailVerifiedAt,
        String? role,
        String? password,
        int? status,
        dynamic lastLoginAt,
        dynamic lastLoginIp,
        bool? termsAccepted,
        dynamic rememberToken,
        dynamic createdAt,
        dynamic updatedAt,
    }) => 
        User(
            id: id ?? this.id,
            name: name ?? this.name,
            surname: surname ?? this.surname,
            email: email ?? this.email,
            emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
            role: role ?? this.role,
            password: password ?? this.password,
            status: status ?? this.status,
            lastLoginAt: lastLoginAt ?? this.lastLoginAt,
            lastLoginIp: lastLoginIp ?? this.lastLoginIp,
            termsAccepted: termsAccepted ?? this.termsAccepted,
            rememberToken: rememberToken ?? this.rememberToken,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        role: json["role"],
        password: json["password"],
        status: json["status"],
        lastLoginAt: json["last_login_at"],
        lastLoginIp: json["last_login_ip"],
        termsAccepted: json["terms_accepted"],
        rememberToken: json["remember_token"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "surname": surname,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "role": role,
        "password": password,
        "status": status,
        "last_login_at": lastLoginAt,
        "last_login_ip": lastLoginIp,
        "terms_accepted": termsAccepted,
        "remember_token": rememberToken,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
