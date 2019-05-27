import 'package:flutter/material.dart';
import 'package:meals_catalogue/breakfast_list.dart';
import 'package:meals_catalogue/dessert_list.dart';

void main() {
  runApp(Home());
}

class Food {
  final String name;
  final String pic;
  final String desc;

  Food({this.name, this.pic, this.desc});
}

class Home extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [Breakfast(), Dessert()];

  @override
  Widget build(BuildContext context) {
    final title = 'Meals Catalogue';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Color(0xFF761322),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, // new
          currentIndex:
              _currentIndex, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.local_dining),
              title: new Text('Breakfast'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.local_cafe),
              title: new Text('Dessert'),
            )
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
