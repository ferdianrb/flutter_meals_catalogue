import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:meals_catalogue/model/food_detail.dart';
// import 'package:is_apn/helper/sales_report_helper.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  //report table
  static const tableFavorite = 'favorite';

  static const columnId = 'id';
  static const columnIdMeal = 'id_meal';
  static const columnCategoryMeal = 'category_meal';
  static const columnStrMeal = 'str_meal';
  static const columnThumbMeal = 'thumb_meal';

  final int databaseVersion = 1;

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'dicoding_apn.db');

    var db = await openDatabase(path,
        version: databaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  Future<int> addFavorite(List<FoodDetail> food) async {
    Map<String, String> list = {
      DatabaseHelper.columnIdMeal: food[0].idMeal,
      DatabaseHelper.columnCategoryMeal: food[0].strCategory,
      DatabaseHelper.columnStrMeal: food[0].strMeal,
      DatabaseHelper.columnThumbMeal: food[0].strMealThumb,
    };
    var dbClient = await db;
    var result = await dbClient.insert(tableFavorite, list);
    return result;
  }
  Future<int> delFavorite(String idMeal) async {
    var dbClient = await db;
    var result = await dbClient.delete(tableFavorite, where: "$columnIdMeal = $idMeal");
    return result;
  }

  Future<List> searchFavoriteById(String idMeal) async {
    var dbClient = await db;
    var result = await dbClient.query(tableFavorite,
        columns: [
          columnId,
          columnIdMeal,
          columnCategoryMeal,
        ],
        where: '$columnIdMeal = $idMeal');
    return result.toList();
  }
  Future<List> searchFavoriteByCategory(String category) async {
    var dbClient = await db;
    var result = await dbClient.query(tableFavorite,
        columns: [
          columnId,
          columnIdMeal,
          columnCategoryMeal,
          columnStrMeal,
          columnThumbMeal
        ],
        where: "$columnCategoryMeal = ?",
        whereArgs: [category]);
    return result.toList();
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('CREATE TABLE IF NOT EXISTS $tableFavorite(' +
        '$columnId INTEGER PRIMARY KEY autoincrement,' +
        '$columnIdMeal TEXT,' +
        '$columnCategoryMeal TEXT,' +
        '$columnStrMeal TEXT,' +
        '$columnThumbMeal TEXT' +
        ');');
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute('CREATE TABLE IF NOT EXISTS $tableFavorite(' +
        '$columnId INTEGER PRIMARY KEY autoincrement,' +
        '$columnIdMeal TEXT,' +
        '$columnCategoryMeal TEXT,' +
        '$columnStrMeal TEXT,' +
        '$columnThumbMeal TEXT' +
        ');');
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
