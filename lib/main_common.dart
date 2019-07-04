import 'package:flutter/material.dart';
import 'view/homepage.dart';
import 'handler/database_handler.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'app_config.dart';

 
void mainCommon() {
  // Here would be background init code, if any
}
 
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    return _buildApp(config.appDisplayName);
  }
 
  Widget _buildApp(String appName) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Color(0xFF761322),
      ),
      home: Home(),
    );
  }
}