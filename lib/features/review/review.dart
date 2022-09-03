import 'package:hive/hive.dart';
part 'review.g.dart';

@HiveType(typeId: 1)
class Review{
  Review();

  @HiveField(0)
  double appRating = 3;

  @HiveField(1)
  String feedback = '';

  toMap(){
    return <String, dynamic>{
      "feedback": this.feedback,
      "appRating": this.appRating,
    };
  }

  Review.fromMap(Map<String, dynamic> map): feedback = map['feedback'],appRating = map['appRating'];
}