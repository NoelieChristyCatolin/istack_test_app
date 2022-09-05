import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: InteractiveViewer(
    //     minScale: 0.1,
    //     maxScale: 5.6,
    //     child: Container(
    //       child: Image.asset('assets/map.jpeg',fit: BoxFit.cover,),
    //     ),
    //   ),
    // );
    return  Center(
      child: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(20.0),
        constrained: false,
        minScale: 0.1,
        maxScale: 5.6,
        child: Container(
          height: 2200,
          width: 1100,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/map.jpeg',))
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: <Color>[Colors.orange, Colors.red],
            //   stops: <double>[0.0, 4.0],
            // ),
          ),
        ),
      ),
    );
  }
}
