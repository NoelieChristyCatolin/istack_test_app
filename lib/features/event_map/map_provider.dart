import 'package:test_app/features/event_map/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_app/core/database/database.dart';

class MapProvider extends ChangeNotifier{

  MapProvider(){
    getLocations();
  }

  List<Location> locations = [];

  Database db = Database();

  getLocations()async{
    locations = await db.getLocations();
    locations.forEach((element) {print('${element.name}}');});
  }
}