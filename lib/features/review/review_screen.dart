import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/review/review_modal.dart';
import 'package:test_app/features/review/review_provider.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ReviewProvider>(context, listen: false).getReviews();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewProvider>(builder:(context, provider, child) => Scaffold(
      body:  ListView.separated(itemCount: provider.reviews.length, itemBuilder: (context, index)=>
          ListTile(title:Text(provider.reviews[index].feedback),
            subtitle: Row(
              children: [
                Text(provider.reviews[index].appRating.toString()),
                SizedBox(width: 5,),
                RatingBar.builder(
                  initialRating: provider.reviews[index].appRating,
                  itemSize: 20,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
          ), separatorBuilder: (BuildContext context, int index) => Divider(),

      ),
    floatingActionButton:  FloatingActionButton(
    child: Icon(Icons.rate_review_outlined),
      onPressed: (){
        return getReview();
      },
    ),),
    );
  }

  getReview() async{
    await showDialog(context: context,barrierDismissible: false, builder: (dialogContext)=> ReviewModal());
  }
}

