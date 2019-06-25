import 'package:flutter/material.dart';
import 'seafood_list.dart';
import 'dessert_list.dart';

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
            children: <Widget>[Seafood(), Dessert()],
          ),
          bottomNavigationBar: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  'Seafood'
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
