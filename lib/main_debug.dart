import 'app_config.dart';
import 'main_common.dart';
import 'handler/database_handler.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:flutter/material.dart';
 
void main() {
  var configuredApp = AppConfig(
    appDisplayName: "App Debug",
    appInternalId: 1,
    child: MyApp(),
  );
 
  mainCommon();
  Stetho.initialize();
  DatabaseHelper().initDb();
  runApp(MyApp());
  runApp(configuredApp);
}