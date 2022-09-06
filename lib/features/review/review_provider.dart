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
   db.addReview(review);
   getReviews();
   screenId=0;
  }

  saveLocally()async{
    var reviewBox = await Hive.openBox('review_box');
    reviewBox.add(review);
    print('reviewBox.values.length: ${reviewBox.values.length}');
  }

  getReviews()async{
    reviews = await db.getReviews();
    notifyListeners();
  }

}