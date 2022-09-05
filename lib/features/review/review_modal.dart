import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/review/review_provider.dart';

class ReviewModal extends StatefulWidget {
  ReviewModal();

  @override
  State<ReviewModal> createState() => _ReviewState();
}

class _ReviewState extends State<ReviewModal> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewProvider>(builder: (context, provider, child)=> Dialog(
      child:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Visibility(
              visible: provider.screenId == 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('App Rating'),
                  Text('How would you rate your experience with us?'),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      provider.review.appRating = rating;
                    },
                  ),
                  //rating label
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          provider.screenId = 1;
                        });
                        },
                      child: Text('Next'))
                ],
              ),
            ),
            Visibility(
              visible: provider.screenId == 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Your opinion matters!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  Text('Let us know what you think'),
                  SizedBox(height: 20,),
                  Container(
                      height: 200,
                      child: TextFormField(
                        controller: controller,
                        decoration: new InputDecoration(
                          hintText: 'Enter ypour feedback here...',
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(8.0),
                            ),
                            borderSide: new BorderSide(
                              color: Colors.black,
                              width: 0.5,
                            ),
                          ),
                        ),
                        onChanged: (value){
                        setState(() {
                          provider.review.feedback = value;
                        });
                      },)),
                  ElevatedButton(
                      onPressed: controller.text == '' ? (){} : (){
                        Navigator.pop(context);
                        provider.saveFeedback();
                      },
                      child: Text('Submit'),
                  style: ElevatedButton.styleFrom(backgroundColor: controller.text == '' ? Colors.blueGrey : Colors.blue))
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
