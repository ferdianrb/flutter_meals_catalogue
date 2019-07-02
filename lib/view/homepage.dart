import 'package:flutter/material.dart';
import 'seafood_list.dart';
import 'dessert_list.dart';
import 'search.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final title = 'Meals Catalogue';

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Search(),
                ),
              );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[Seafood(), Dessert(),Dessert()],
        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              child: Column(
              children: [Icon(Icons.adb), Text('Seafood')],
            )
            ),
            Tab(
                child: Column(
              children: [Icon(Icons.fastfood), Text('Desert')],
            )),
            Tab(
                child: Column(
              children: [Icon(Icons.favorite), Text('Favorite')],
            )),
          ],
          indicatorColor: Colors.red,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.grey,
        ),
      ),
    );
  }
}
