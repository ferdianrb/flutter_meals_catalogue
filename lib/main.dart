import 'package:flutter/material.dart';
import 'view/homepage.dart';

final title = 'Meals Catalogue';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Color(0xFF761322),
        ),
        home: Home(),
      );
  }
}
