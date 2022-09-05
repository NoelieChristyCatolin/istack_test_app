import 'package:hive/hive.dart';
part 'location.g.dart';

@HiveType(typeId: 1)
class Location{
  Location();

  @HiveField(0)
  String name = '';

  @HiveField(1)
  String details = '';

  @HiveField(2)
  String opening = '';

  @HiveField(3)
  String closing = '';

  @HiveField(4)
  double fee = 0;

  @HiveField(5)
  String image = '';

  toMap(){
    return <String, dynamic>{
      "name": this.name,
      "details": this.details,
      "opening": this.opening,
      "closing": this.closing,
      "fee": this.fee,
      "image": this.image,
    };
  }

  Location.fromMap(Map<String, dynamic> map):
        name = map['name'],
        details = map['details'],
        opening = map['opening'],
        closing = map['closing'],
        fee = map['fee'],
        image = map['image'];
}