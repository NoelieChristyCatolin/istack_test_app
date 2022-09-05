import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/event_map/map_provider.dart';
import 'package:test_app/features/event_map/marker.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return  Consumer<MapProvider>(
      builder: (context, provider, child)=>InteractiveViewer(
        minScale: 0.1,
        maxScale: 5.6,
        child: Stack(
          children: [
            Container(
              height: height,
              width:  width,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/map.jpeg', ),fit: BoxFit.fill)
              ),
            ),
            Stack(
              // children:  provider.locations.map((e) =>
              //     Marker(id: e.id,x: e.x, y: e.y,height: e.height,width: e.width,)).toList(),
              children:  provider.locations.map((e) =>
                  Marker(location: e,)).toList(),
              // children: [
                // Container(
                //   height: height,
                //   width:  width,
                //   decoration: const BoxDecoration(
                //       image: DecorationImage(image: AssetImage('assets/map.jpeg', ),fit: BoxFit.fill)
                //   ),
                // ),
                // //gas Station
                // Marker(id: 1,x: .05, y: .23,height: .09,width: .15,),
                // //central park
                // Marker(id: 2,x: .3, y: .25,height: .25,width: .3,),
                // //pond
                // Marker(id: 3,x: .6, y: .43,height: .07,width: .15,),
                // //castle
                // Marker(id: 4,x: .45, y: .09,height: .12,width: .3,),
                // //helicopter
                // Marker(id: 5,x: .83, y: .02,height: .06,width: .11,),
                // //forest
                // Marker(id: 6,x: .88, y: .33,height: .12,width: .1,),
                // //zoo
                // Marker(id: 7,x: .08, y: .58,height: .15,width: .3,),
                // //garden
                // Marker(id: 8,x: .5, y: .61,height: .08,width: .2,),
                // //construction ongoing
                // Marker(id: 9,x: .8, y: .53,height: .2,width: .15,),
              // ],
            ),
          ],
        ),
      ),
    );
  }
}
