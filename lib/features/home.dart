import 'package:flutter/material.dart';
import 'package:test_app/features/review/review_modal.dart';

class Home extends StatefulWidget {
  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getReview()async{
    await showDialog(context: context,barrierDismissible: false, builder: (dialogContext)=> ReviewModal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test App'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.rate_review_outlined),
        onPressed: (){
          return getReview();
        },
      ),
    );
  }
}