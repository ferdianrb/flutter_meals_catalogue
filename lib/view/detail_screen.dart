import 'package:flutter/material.dart';
import '../model/food.dart';

class DetailScreen extends StatelessWidget {
  final Food item;
  DetailScreen({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Detail'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: ListView(padding: EdgeInsets.all(40.0), children: [
        Hero(
          tag: item.pic,
          child: CircleAvatar(
            backgroundImage: ExactAssetImage(item.pic),
            minRadius: 80,
            maxRadius: 130,
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              item.name,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              item.desc,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
      ]),
    );
  }
}
