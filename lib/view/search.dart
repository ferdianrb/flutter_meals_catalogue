import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals_catalogue/model/food_detail.dart';
import '../model/food.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _search;
  List<FoodDetail> detail = [];
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
            .map((p) => FoodDetail.fromJson((p)))
            .toList();
        print("detail ${detail.length}");
        list = ListView.builder(
          itemCount: detail.length,
          itemBuilder: (context, item) {
            print("item $item");
            return Text("tes");
          },
        );
      });
    }
  }

  Widget getBody() {
    setState(() {
      list = Text("tester");
    });
    return list;
  }

  @override
  void initState() {
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
      body: getBody(),
    );
  }
}
