import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/features/event_map/location.dart';
import 'package:test_app/features/review/review.dart';

class Database{
  final _firestore = FirebaseFirestore.instance;
  final reviewCollection = "reviews";
  final locationCollection = "locations";

  void addReview(Review review) {
    _firestore.collection(reviewCollection).add(review.toMap());
  }

  getReviews()async{
    List<Review> reviews = [];
    await _firestore.collection(reviewCollection).get().then((event) {
      for (var doc in event.docs) {
        reviews.add(Review.fromMap(doc.data()));
      }
    });
    return reviews;
  }

  void addLocations(Location location) {
    _firestore.collection(locationCollection).add(location.toMap());
  }

  getLocations()async{
      List<Location> locations = [];
      await _firestore.collection(locationCollection).get().then((event) {
        for (var doc in event.docs) {
          locations.add(Location.fromMap(doc.data()));
        }
      });
      print('locations: ${locations.length}');
      return locations;

  }

}