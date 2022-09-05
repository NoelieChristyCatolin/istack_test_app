import 'package:hive/hive.dart';
part 'location.g.dart';

@HiveType(typeId: 2)
class Location{
  Location({this.id = 0,
    this.name = '',
    this.details = '',
    this.opening = '',
    this.closing = '',
    this.fee = 0,
    this.image = '',
    this.y = 0,
    this.x = 0,
    this.width = 0,
    this.height = 0,
  });

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String details;

  @HiveField(3)
  String opening;

  @HiveField(4)
  String closing;

  @HiveField(5)
  double fee;

  @HiveField(6)
  String image;

  @HiveField(7)
  double x;

  @HiveField(8)
  double y;

  @HiveField(9)
  double width;

  @HiveField(10)
  double height;

  toMap(){
    return <String, dynamic>{
      "id": this.id,
      "name": this.name,
      "details": this.details,
      "opening": this.opening,
      "closing": this.closing,
      "fee": this.fee,
      "image": this.image,
      "y": this.y,
      "x": this.x,
      "height": this.height,
      "width": this.width,
    };
  }

  Location.fromMap(Map<String, dynamic> map):
        id = map['id'],
        name = map['name'],
        details = map['details'],
        opening = map['opening'],
        closing = map['closing'],
        fee = double.parse(map['fee'].toString()),
        image = map['image'],
  y = map['y'],
  x = map['x'],
  height = map['height'],
  width = map['width'];
}