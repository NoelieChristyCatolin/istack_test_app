import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:test_app/core/database/database.dart';
import 'package:test_app/features/review/review.dart';

class ReviewProvider extends ChangeNotifier{

  List<Review> reviews = [];

  Database db = Database();
  Review review = Review();
  int screenId = 0;

  saveFeedback(){
   saveLocally();
   db.addReview(review);
   getReviews();
  }

  saveLocally()async{
    var reviewBox = await Hive.openBox('review_box');
    var collections = reviewBox.values;
    reviewBox.put(collections.length, review);
  }

  getReviews()async{
    try{
      reviews = await db.getReviews();
    }
    catch(err){
      reviews.clear();
      var reviewBox = await Hive.openBox('review_box');
      reviewBox.keys.forEach((element)async {
        var data = await reviewBox.get(0);
        reviews.add(data);
      });
    }
    notifyListeners();
  }

}