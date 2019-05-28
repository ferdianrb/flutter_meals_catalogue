import 'package:flutter/material.dart';
import 'breakfast_list.dart';
import 'dessert_list.dart';

void main() {
  runApp(Home());
}


class Home extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<Home> {

  @override
  Widget build(BuildContext context) {
    final title = 'Meals Catalogue';

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          body: TabBarView(
            children: <Widget>[Breakfast(), Dessert()],
          ),
          bottomNavigationBar: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Breakfast'
                ),
              ),
              Tab(
                child: Text(
                  'Desert'
                ),
              ),
            ],
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
          ),
        ),
      );
  }
}
