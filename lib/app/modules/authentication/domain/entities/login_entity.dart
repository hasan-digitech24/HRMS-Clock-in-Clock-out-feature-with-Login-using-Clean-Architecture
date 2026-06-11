// To parse this JSON data, do
//
//     final loginEntity = loginEntityFromJson(jsonString);

import 'dart:convert';

// LoginEntity loginEntityFromJson(String str) => LoginEntity.fromJson(json.decode(str));

// String loginEntityToJson(LoginEntity data) => json.encode(data.toJson());

class LoginEntity {
    String username;
    String password;

    LoginEntity({
        required this.username,
        required this.password,
    });

    factory LoginEntity.fromJson(Map<String, dynamic> json) => LoginEntity(
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}
