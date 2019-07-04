import 'package:flutter/material.dart';
import 'seafood_list.dart';
import 'dessert_list.dart';
import 'search.dart';
import 'favorite_list.dart';
import 'package:meals_catalogue/app_config.dart';

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
    // final title = 'Meals Catalogue';
    var config = AppConfig.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(config.appDisplayName),
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
          children: <Widget>[Seafood(), Dessert(),Favorite()],
        ),
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              child: Column(
              children: [Icon(Icons.adb), Text('Seafood', key: Key('seafood'),)],
            )
            ),
            Tab(
                child: Column(
              children: [Icon(Icons.fastfood), Text('Dessert', key: Key('dessert'),)],
            )),
            Tab(
                child: Column(
              children: [Icon(Icons.favorite), Text('Favorite', key: Key('favorite'))],
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
