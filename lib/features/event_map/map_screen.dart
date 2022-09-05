import 'package:flutter/material.dart';
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

    return  InteractiveViewer(
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
          //helicopter
          Marker(positionLeft: .83, positionTop: .02,height: .06,width: .11,),
          //construction ongoing
          Marker(positionLeft: .8, positionTop: .53,height: .2,width: .15,),
          //zoo
          Marker(positionLeft: .08, positionTop: .58,height: .15,width: .3,),
          //gas Station
          Marker(positionLeft: .05, positionTop: .23,height: .09,width: .15,),
          //castle
          Marker(positionLeft: .45, positionTop: .09,height: .12,width: .3,),
          //pond
          Marker(positionLeft: .6, positionTop: .43,height: .07,width: .15,),
          //central park
          Marker(positionLeft: .3, positionTop: .25,height: .25,width: .3,),
          //forest
          Marker(positionLeft: .88, positionTop: .33,height: .12,width: .1,),
          //garden
          Marker(positionLeft: .5, positionTop: .61,height: .08,width: .2,),
        ],
      ),
    );
  }
}
