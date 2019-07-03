import 'package:meals_catalogue/handler/database_handler.dart';
class Food {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  final String strCategory;

  Food(this.idMeal, this.strMeal, this.strMealThumb,this.strCategory);
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(json['idMeal'], json['strMeal'], json['strMealThumb'],json['strCategory']);
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      // DatabaseHelper.columnId: id,
      DatabaseHelper.columnIdMeal: idMeal,
      DatabaseHelper.columnCategoryMeal: strCategory
    };
    return map;
  }
}
