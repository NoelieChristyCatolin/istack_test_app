import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/features/review/review.dart';

class Database{
  final _firestore = FirebaseFirestore.instance;
  final collectionName = "review";

  void addReview(Review review) {
    _firestore.collection(collectionName).add(review.toMap());
  }

  getReviews()async{
    List<Review> reviews = [];
    await _firestore.collection(collectionName).get().then((event) {
      for (var doc in event.docs) {
        reviews.add(Review.fromMap(doc.data()));
      }
    });
    return reviews;
  }

  // Future<List<JotList>> fetchData() async{
  //   List<JotList> list =[];
  //   await _firestore.collection(collectionName)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) =>  {
  //     querySnapshot.docs.forEach((doc) {
  //       list.add(JotList(id: doc.id ,name:doc.data()['name'] , elements: toListString(doc.data()['elements']), isDone: doc.data()['isDone'] ));
  //     })
  //   });
  //   return list;
  // }

}