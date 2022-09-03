import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Consumer<ReviewProvider>(builder:(context, provider, child) => Scaffold(
      // appBar: AppBar(title: Text('Reviews'),),
      body:  ListView.builder(itemCount: provider.reviews.length, itemBuilder: (context, index)=>
          ListTile(title:Text(provider.reviews[index].feedback),subtitle: Text(provider.reviews[index].appRating.toString()) ,)
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

