import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/event_map/location.dart';
import 'package:test_app/features/event_map/map_provider.dart';

class Marker extends StatelessWidget {
  // Marker({this.x = 0, this.y = 0, this.width = 0, this.height =0});
  // int id;
  // double x;
  // double y;
  // double width;
  // double height;
  Marker({required this.location});
  final Location location;

  @override
  Widget build(BuildContext context) {

    var mediaWidth = MediaQuery.of(context).size.width;
    var mediaHeight = MediaQuery.of(context).size.height;
    return Consumer<MapProvider>(builder:(context, provider, child){
      // var location = provider.locations[id];
      return Positioned(
      left: mediaWidth * location.x,
      top:  mediaHeight * location.y,
      child: GestureDetector(
        onTap: (){
          showDialog(context: context, builder: (modalContext)=> Dialog(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          FadeInImage(image: NetworkImage(location.image), placeholder: AssetImage('assets/placeholder.png'),height: 100, width: 100,),
                          Expanded(child: Text(location.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(location.details, textAlign: TextAlign.center, style: TextStyle(color: Colors.blueGrey,),),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(color: Colors.black45),
                                children: [TextSpan(text: 'Time: ', style: TextStyle(fontWeight: FontWeight.bold),),
                                  TextSpan(text: '${location.opening} - ${location.closing}'),
                                ]
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(color: Colors.black45),
                                children: [TextSpan(text: 'Fee: ', style: TextStyle(fontWeight: FontWeight.bold),),
                                  TextSpan(text: "P ${location.fee}"),]
                            )
                        ),
                      ),
                    ),
                  ]
              ),
            ),
          ));
        },
        child: Container(
          height: mediaHeight * location.height,
          width: mediaWidth * location.width,
          color: Colors.black.withOpacity(0.2),
        ),
      ),
    );
    }
    );
  }
}
