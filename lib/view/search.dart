import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../model/food.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'detail_screen.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _search;
  List<Food> detail = [];
  Widget list;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  fetchFoodDetail() async {
    String idMeal = _search.text;
    String dataUrl =
        "https://www.themealdb.com/api/json/v1/1/search.php?s=$idMeal";

    http.Response response = await http.get(dataUrl);
    print("res ${response.body}");

    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        detail = (responseJson['meals'] as List)
            .map((p) => Food.fromJson((p)))
            .toList();
        print("detail ${detail.length}");
        list = GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: detail.length,
          itemBuilder: (context, item) {
            print("item $item");
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
                      builder: (context) => DetailScreen(idMeal: detail[item].idMeal),
                    ),
                  );
                  final snackBar = SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text(detail[item].strMeal),
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
                        tag: detail[item].idMeal,
                        child: Image.network(
                          detail[item].strMealThumb,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          detail[item].strMeal,
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
      });
    }
  }

  @override
  void initState() {
    list = Container();
    _search = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: TextField(
          controller: _search,
          onEditingComplete: fetchFoodDetail,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.cancel, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: list,
    );
  }
}
