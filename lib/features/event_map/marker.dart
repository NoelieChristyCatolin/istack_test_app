import 'package:flutter/material.dart';

class Marker extends StatelessWidget {
  Marker({this.positionLeft = 0, this.positionTop = 0, this.width = 0, this.height =0});
  double positionLeft;
  double positionTop;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;
    var mediaHeight = MediaQuery.of(context).size.height;
    return   Positioned(
      left: mediaWidth * positionLeft,
      top:  mediaHeight * positionTop,
      child: GestureDetector(
        onTap: (){
          showDialog(context: context, builder: (modalContext)=> Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Central Park', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Divider(),
                    Text('Go and feel the thrill of the worlds best park!', textAlign: TextAlign.center, style: TextStyle(color: Colors.blueGrey,),),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.black45),
                              children: [TextSpan(text: 'Time: ', style: TextStyle(fontWeight: FontWeight.bold),),
                            TextSpan(text: '8:00 AM - 6:00 PM'),]
                          )
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.black45),
                              children: [TextSpan(text: 'Fee: ', style: TextStyle(fontWeight: FontWeight.bold),),
                            TextSpan(text: '100 php'),]
                          )
                      ),
                    ),
                  ]
              ),
            ),
          ));
        },
        child: Container(
            height: mediaHeight * height,
            width: mediaWidth * width,
            color: Colors.black.withOpacity(0.2),
        ),
      ),
    );
  }
}
