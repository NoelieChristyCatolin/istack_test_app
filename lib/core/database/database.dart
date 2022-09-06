import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/features/event_map/location.dart';
import 'package:test_app/features/review/review.dart';

//Cloud Firestore supports offline data persistence.
//https://l.facebook.com/l.php?u=https%3A%2F%2Ffirebase.google.com%2Fdocs%2Ffirestore%2Fmanage-data%2Fenable-offline%3Ffbclid%3DIwAR1bicm9cKZKLCwpFefFEjaRiPtTePG_HqE6D3pgW_no8sOlen-I-Sz2nog&h=AT29yddwNJJg0NR7V-qtkT-P5i9BQDs_rR360fJD4vk49_T3dkhoqC6zXI24Ksg5koBEBz1SQOcPF6WN5qgsV4848Yy30My65QpHD_olSWbXLZTTVxD5ELVnLHZliFCrnw_2DM0o8v0
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
      return locations;

  }

}