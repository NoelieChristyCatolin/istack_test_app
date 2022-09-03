import 'package:flutter/material.dart';
import 'package:test_app/features/event_map/map_screen.dart';
import 'package:test_app/features/review/review_modal.dart';
import 'package:test_app/features/review/review_screen.dart';

class Home extends StatefulWidget {
  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    MapScreen(),
    ReviewScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test App'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'), BottomNavigationBarItem(icon: Icon(Icons.rate_review_outlined),label: 'Reviews')],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}