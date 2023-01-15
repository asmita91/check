// To parse this JSON data, do
//
//     final ratingReviewModel = ratingReviewModelFromJson(jsonString);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

RatingReviewModel ratingReviewModelFromJson(String str) => RatingReviewModel.fromJson(json.decode(str));

String ratingReviewModelToJson(RatingReviewModel data) => json.encode(data.toJson());

class RatingReviewModel {
  RatingReviewModel({
    
    required this.rating,
    required this.review,
  });

  String rating;
  String review;

  factory RatingReviewModel.fromFirebaseSnapshot(
      DocumentSnapshot<Map<String, dynamic>> json) => RatingReviewModel(
    rating: json["Rating"],
    review: json["Review"],
  );

  factory RatingReviewModel.fromJson(Map<String, dynamic> json) => RatingReviewModel(
    rating: json["Rating"],
    review: json["Review"],
  );

  Map<String, dynamic> toJson() => {
    "Rating": rating,
    "Review": review,
  };

}
