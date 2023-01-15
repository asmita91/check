// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel? userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel? data) => json.encode(data!.toJson());

class UserModel {
  UserModel({
    this.userId,
    this.fcmToken,
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.password,
    this.phone,
    this.imagepath,
    this.imageUrl,
  });

  String? userId;
  String? fcmToken;
  String? firstname;
  String? lastname;
  String? username;
  String? email;
  String? password;
  String? phone;
  String? imagepath;
  String? imageUrl;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json["user_id"],
    fcmToken: json["fcm_token"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    imagepath: json["imagepath"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "fcm_token": fcmToken,
    "firstname": firstname,
    "lastname": lastname,
    "username": username,
    "email": email,
    "password": password,
    "phone": phone,
    "imagepath": imagepath,
    "imageUrl": imageUrl,
  };

  factory UserModel.fromFirebaseSnapshot(DocumentSnapshot<Map<String, dynamic>> json) => UserModel(
    userId: json["user_id"],
    fcmToken: json["fcm_token"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
    imagepath: json["imagepath"],
    imageUrl: json["imageUrl"],
  );
}
