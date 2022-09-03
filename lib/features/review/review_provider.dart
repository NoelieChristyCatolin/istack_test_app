import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:test_app/core/database/database.dart';
import 'package:test_app/features/review/review.dart';

class ReviewProvider extends ChangeNotifier{
  ReviewProvider(){
    getReviews();
  }

  List<Review> reviews = [];

  Database db = Database();
  Review review = Review();
  int screenId = 0;

  saveFeedback(){
   saveLocally();
   db.addReview(review);
  }

  saveLocally()async{
    var box = await Hive.openBox('appBox');
    //todo: make this a list
    box.put('review', review);
    // Review stored = box.get('review');
  }

  getReviews()async{
    reviews = await db.getReviews();
    reviews.forEach((element) {print('${element.appRating} - ${element.feedback}');});
  }

}