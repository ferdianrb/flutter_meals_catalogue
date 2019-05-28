import 'package:flutter/material.dart';
import '../data/dessert.dart';
import 'detail_screen.dart';

class Dessert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: dessert.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.grey,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: dessert[index]),
                ),
              );
              final snackBar = SnackBar(
                duration: Duration(seconds: 1),
                content: Text(dessert[index].name),
                action: SnackBarAction(
                  textColor: Colors.blue,
                  label: 'Close',
                  onPressed: () {},
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 14.0,
                  child: Hero(
                    tag: dessert[index].pic,
                    child: Image.asset(
                      dessert[index].pic,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      dessert[index].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}