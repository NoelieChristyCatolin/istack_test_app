import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:test_app/core/database/database.dart';
import 'package:test_app/features/review/review.dart';

class ReviewProvider extends ChangeNotifier{
  ReviewProvider();

  List<Review> reviews = [];

  Database db = Database();
  Review review = Review();
  int screenId = 0;

  saveFeedback(){
   saveLocally();

  }

  saveLocally()async{
    var box = await Hive.openBox('appBox');
    box.put('review', review);
    Review stored = box.get('review');
    db.addReview(review);
    reviews = await db.getReviews();
    reviews.forEach((element) {print('${element.appRating} - ${element.feedback}');});
  }

}