import 'package:flutter/material.dart';
import 'package:meals_catalogue/model/food.dart';
import 'detail_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meals_catalogue/handler/database_handler.dart';

class Favorite extends StatefulWidget {
  Favorite({Key key}) : super(key: key);
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> with SingleTickerProviderStateMixin{
  List<Food> Favorite = [];
  DatabaseHelper db;
  Widget gv;
  TabController _controller;

  @override
  void initState() {
    db = DatabaseHelper();
    gv = Container();
    _controller = TabController(vsync: this, length: 2);
    _controller.addListener(_handleTabSelection);
    loadFavoriteData("Dessert");
    super.initState();
    // loadFavoriteData();
  }
  _handleTabSelection() {
    if(_controller.index==0){
      loadFavoriteData("Dessert");
    }
    else{
      loadFavoriteData("Seafood");
    }
      print(_controller.index);

  }
  loadFavoriteData(String category) async {
    db.searchFavoriteByCategory(category).then((val){
      setState(() {
        gv = getGridView(val);
      });
    });
    

    // String dataUrl =
    //     "https://www.themealdb.com/api/json/v1/1/filter.php?c=Favorite";

    // http.Response response = await http.get(dataUrl);

    // var responseJson = json.decode(response.body);

    // if (response.statusCode == 200) {
    //   setState(() {
    //     Favorite = (responseJson['meals'] as List)
    //         .map((p) => Food.fromJson((p)))
    //         .toList();
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GetBody();
  }

  GetBody() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          controller: _controller,
          tabs: [
            Tab(child: Text("Dessert"),),
            Tab(child: Text("Seafood"))
          ],
          indicatorColor: Colors.red,
          labelColor: Colors.redAccent,
        ),
        body: TabBarView(
          children: [
            gv,
            gv
          ],
        ),
      ),
    );
  }

  getGridView(List fav) {
    // print("fav "+fav[0].);
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: fav.length,
      itemBuilder: (context, index) {
        print("ind ${fav[index]["id_meal"]}");
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
                  builder: (context) => DetailScreen(idMeal: fav[index]["id_meal"]),
                ),
              );
              final snackBar = SnackBar(
                duration: Duration(seconds: 1),
                content: Text(fav[index]["str_meal"]),
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
                    tag: fav[index]["id_meal"],
                    child: Image.network(
                      fav[index]["thumb_meal"],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      fav[index]["str_meal"],
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
