import 'package:flutter/material.dart';
import 'package:meals_catalogue/model/food.dart';
import 'detail_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Dessert extends StatefulWidget {
  Dessert({Key key}) : super(key: key);
  @override
  _DessertState createState() => _DessertState();
}

class _DessertState extends State<Dessert> {
  List<Food> dessert = [];

  @override
  void initState() {
    super.initState();
    loadDessertData();
  }

  loadDessertData() async {
    String dataUrl =
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert";

    http.Response response = await http.get(dataUrl);

    var responseJson = json.decode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        dessert = (responseJson['meals'] as List)
            .map((p) => Food.fromJson((p)))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBody();
  }

  GetBody() {
    if (dessert.length == 0) {
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
      itemCount: dessert.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.grey,
          child: GestureDetector(
            key: Key("detail_food$index"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(idMeal: dessert[index].idMeal),
                ),
              );
              final snackBar = SnackBar(
                duration: Duration(seconds: 1),
                content: Text(dessert[index].strMeal),
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
                    tag: dessert[index].idMeal,
                    child: Image.network(
                      dessert[index].strMealThumb,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      dessert[index].strMeal,
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
