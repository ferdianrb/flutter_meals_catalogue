import 'package:meals_catalogue/main.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Food item;
  DetailScreen({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Makanan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: ListView(children: [
        Padding(
            padding: EdgeInsets.all(40),
            child: CircleAvatar(
              backgroundImage: ExactAssetImage(item.pic),
              minRadius: 80,
              maxRadius: 160,
            )),
        Center(
            child: Padding(
                padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                child: Text(item.name,
                    style: TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.bold)))),
        Padding(
            padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
            child: Text(item.desc,
                textAlign: TextAlign.justify, style: TextStyle(fontSize: 20.0)))
      ]),
    );
  }
}