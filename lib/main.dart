import 'package:flutter/material.dart';
import 'view/homepage.dart';
import 'handler/database_handler.dart';
import 'package:flutter_stetho/flutter_stetho.dart';

final title = 'Meals Catalogue';

void main() {
  Stetho.initialize();
  DatabaseHelper().initDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
