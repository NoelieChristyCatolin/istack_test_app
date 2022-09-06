import 'package:hive/hive.dart';
part 'review.g.dart';

@HiveType(typeId: 1)
class Review{
  Review();

  @HiveField(0)
  int id = 0;

  @HiveField(1)
  double appRating = 3;

  @HiveField(2)
  String feedback = '';

  @HiveField(3)
  String date = '';

  toMap(){
    return <String, dynamic>{
      "id": this.id,
      "feedback": this.feedback,
      "appRating": this.appRating,
      "date": this.date,
    };
  }

  Review.fromMap(Map<String, dynamic> map):
        id = map['id'],
        feedback = map['feedback'],
        appRating = map['appRating'],
        date = map['date'];
}