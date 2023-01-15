import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../models/ratingreview_model.dart';
import '../viewmodels/ratingreview_viewmodel.dart';


class AdminRatingReview extends StatefulWidget {
  const AdminRatingReview({Key? key}) : super(key: key);

  @override
  State<AdminRatingReview> createState() => _AdminRatingReviewState();
}

class _AdminRatingReviewState extends State<AdminRatingReview> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  // ProductRepository _productRepository = ProductRepository();
  late RatingReviewViewModel _ratingReviewViewModel;
  @override
  void initState(){
    _ratingReviewViewModel = Provider.of<RatingReviewViewModel>(context, listen: false);
    _ratingReviewViewModel.getRatingReview();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var ratingreview =context.watch<RatingReviewViewModel>().ratingreview;
    return Scaffold(
      body: StreamBuilder(
          stream: ratingreview,
          builder: (context,
              AsyncSnapshot<QuerySnapshot<RatingReviewModel>> snapshot) {
            if (snapshot.hasError) return Text("Error");
            return ListView(
              children: [
                ...snapshot.data!.docs.map((document) {
                  RatingReviewModel ratingreview = document.data();

                  return ListTile(
                    title: Text(
                      ratingreview.rating ,
                      style: TextStyle(fontSize: 40),
                    ),
                    subtitle: Text(ratingreview.review),
                  );
                }),
              ],
            );
          }),
    );
  }
}

