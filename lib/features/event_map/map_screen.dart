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
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MapProvider>(context, listen: false).getLocations();
  }

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
              children:  provider.locations.map((e) =>
                  Marker(location: e,)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
