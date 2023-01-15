// To parse this JSON data, do
//
//     final adminPaymentModel = adminPaymentModelFromJson(jsonString);

import 'dart:convert';

AdminPaymentModel? adminPaymentModelFromJson(String str) =>
    AdminPaymentModel.fromJson(json.decode(str));

String adminPaymentModelToJson(AdminPaymentModel? data) =>
    json.encode(data!.toJson());

class AdminPaymentModel {
  AdminPaymentModel({
    this.paymentId,
    this.userId,
    this.userName,
    this.userImage,
    this.packagePrice,
    this.packageId,
  });

  String? paymentId;
  String? userId;
  String? userName;
  String? userImage;
  int? packagePrice;
  String? packageId;

  factory AdminPaymentModel.fromJson(Map<String, dynamic> json) =>
      AdminPaymentModel(
        paymentId: json["paymentId"],
        userId: json["userId"],
        userName: json["userName"],
        userImage: json["userImage"],
        packagePrice: json["packagePrice"],
        packageId: json["packageId"],
      );

  Map<String, dynamic> toJson() => {
        "paymentId": paymentId,
        "userId": userId,
        "userName": userName,
        "userImage": userImage,
        "packagePrice": packagePrice,
        "packageId": packageId,
      };
}
