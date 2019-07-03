import 'package:flutter/material.dart';
import 'package:meals_catalogue/model/food.dart';
import 'detail_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Seafood extends StatefulWidget {
  Seafood({Key key}) : super(key: key);
  @override
  _SeafoodState createState() => _SeafoodState();
}

class _SeafoodState extends State<Seafood> {
  List<Food> seafood = [];
  loadSeafoodData() async {
    String dataUrl =
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood";

    http.Response response = await http.get(dataUrl);

    var responseJson = json.decode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        seafood = (responseJson['meals'] as List)
            .map((p) => Food.fromJson((p)))
            .toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadSeafoodData();
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  getBody() {
    if (seafood.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return getGridView();
    }
  }

  getGridView() {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: seafood.length,
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
                  builder: (context) => DetailScreen(idMeal: seafood[index].idMeal),
                ),
              );
              final snackBar = SnackBar(
                duration: Duration(seconds: 1),
                content: Text(seafood[index].strMeal),
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
                    tag: seafood[index].idMeal,
                    child: Image.network(
                      seafood[index].strMealThumb,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      seafood[index].strMeal,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
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
