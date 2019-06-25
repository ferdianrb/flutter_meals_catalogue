import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals_catalogue/model/food_detail.dart';
import '../model/food.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailScreen extends StatefulWidget {
  final Food item;
  DetailScreen({Key key, this.item}) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<FoodDetail> detail = [];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // Future<Null>.delayed(Duration.zero, (){
    //   Scaffold.of(context).showSnackBar(
    //     SnackBar(
    //               content: Text(widget.item.strMeal),
    //               action: SnackBarAction(
    //                 textColor: Colors.blue,
    //                 label: 'Close',
    //                 onPressed: () {},
    //               ),
    //             ),
    //   );
    // });
    super.initState();
    fetchFoodDetail(widget.item.idMeal);
  }

  fetchFoodDetail(String idMeal) async {
    String dataUrl =
        "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$idMeal";

    http.Response response = await http.get(dataUrl);

    var responseJson = json.decode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        detail = (responseJson['meals'] as List)
            .map((p) => FoodDetail.fromJson((p)))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Food Detail'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: getBody(),
    );
  }

  getBody() {
    if (detail.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      showSnackbar(widget.item.strMeal);
      return getDetailedFood();
    }
  }

  getDetailedFood() {
    return ListView(padding: EdgeInsets.all(40.0), children: [
      Hero(
        tag: detail[0].idMeal,
        child: CircleAvatar(
          backgroundImage: NetworkImage(detail[0].strMealThumb),
          minRadius: 80,
          maxRadius: 130,
        ),
      ),
      Align(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            detail[0].strMeal,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Ingredients:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: GetIngredientList(detail[0].strIngredients),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Instructions:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
        ),
      ),
      Align(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            detail[0].strInstructions,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15.0),
          ),
        ),
      ),
    ]);
  }

  List<Padding> GetIngredientList(List<String> stringList) {
    List<Padding> childrenTexts = List<Padding>();

    for (String string in stringList) {
      if (string.length > 0) {
        childrenTexts.add(Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                '*) ' + string,
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          ),
        ));
      }
    }
    return childrenTexts;
  }
  
  void showSnackbar(String value) {
    final snackbar = SnackBar(
      content: Text(value),
      action: SnackBarAction(
        textColor: Colors.blue,
        label: 'Close',
        onPressed: () {},
      ),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
