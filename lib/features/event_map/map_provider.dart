import 'package:hive/hive.dart';
import 'package:test_app/features/event_map/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_app/core/database/database.dart';

class MapProvider extends ChangeNotifier{

  MapProvider(){
    getLocations();
    // addLocations(Location(id:0, x: .05, y: .23,height: .09,width: .15, name: 'Gas Station', details: 'Get the lowest here!', opening:'5:A00 AM', closing: "9:00 PM", fee: 0, image: "https://www.citypng.com/public/uploads/preview/gas-fuel-station-black-icon-transparent-png-11639852623kn6mczasbx.png"));
    // addLocations(Location(id:1, x: .3, y: .25,height: .25,width: .3,name: 'Central park', details: 'Go and feel the thrill of the world\'s best park!', opening:'7:A00 AM', closing: "6:00 PM", fee: 0, image: "https://t4.ftcdn.net/jpg/03/39/09/97/360_F_339099763_yrjvgP2Qq8loTjfgRrIHx4UMzPWDETr3.jpg"));
    // addLocations(Location(id:2, x: .6, y: .43,height: .07,width: .15,name: 'Pond', details: 'Meet our friendly duck here!', opening:'5:A00 AM', closing: "5:00 PM", fee: 0, image: "https://cdn-icons-png.flaticon.com/512/4251/4251873.png"));
    // addLocations(Location(id:3, x: .45, y: .09,height: .12,width: .3,name: 'Castle', details: 'Complete your disney princess dream!', opening:'7:A00 AM', closing: "6:00 PM", fee: 250, image: "https://www.pngitem.com/pimgs/m/109-1096095_castle-castle-icon-png-transparent-png.png"));
    // addLocations(Location(id:4,x: .83, y: .02,height: .06,width: .11, name: 'Helipad', details: 'For VIP clients only', opening:'9:A00 AM', closing: "3:00 PM", fee: 5000, image: "http://cdn.onlinewebfonts.com/svg/img_493600.png"));
    //
    // addLocations(Location(id:5,x: .88, y: .33,height: .12,width: .1, name: 'Forest', details: 'Take a walk with nature', opening:'5:A00 AM', closing: "5:00 PM", fee: 50,  image: "https://www.clipartmax.com/png/middle/98-982849_forest-comments-forest-icon-white.png"));
    // addLocations(Location(id:6, x: .08, y: .58,height: .15,width: .3,name: 'Zoo', details: 'See the rarest animals!', opening:'6:A00 AM', closing: "8:00 PM", fee: 0,  image: "https://cdn-icons-png.flaticon.com/512/2093/2093607.png"));
    // addLocations(Location(id:7, x: .5, y: .61,height: .08,width: .2,name: 'Garden', details: 'Go and feel the thrill of the worlds best park!', opening:'7:A00 AM', closing: "6:00 PM", fee: 0,  image: "https://www.kindpng.com/picc/m/12-120260_png-file-svg-garden-icon-png-transparent-png.png"));
    // addLocations(Location(id:8,x: .8, y: .53,height: .2,width: .15, name: 'Construction On-going', details: 'Opening soon!', opening:'-', closing: "-", fee: 0,  image: "https://w7.pngwing.com/pngs/861/197/png-transparent-computer-icons-architectural-engineering-building-construction-worker-construction-site-hat-building-text.png"));
  }

  List<Location> locations = [];

  Database db = Database();

  addLocations(Location location)async{
    db.addLocations(location);
    locations.forEach((element) {print('${element.name}');});
  }

  getLocations() async{
    try{
      locations =  await db.getLocations();
      saveLocally();
    }
    catch(err){
      var locationBox = await Hive.openBox('location_box');
      locationBox.keys.forEach((element)async {
        var data = await locationBox.get(0);
        locations.add(data);
      });

    }

    notifyListeners();
  }

  saveLocally()async{
    var locationBox = await Hive.openBox('location_box');
    locations.forEach((element) {
      locationBox.add(element);
    });
    print('locationBox.values.length: ${locationBox.values.length}');
  }
}