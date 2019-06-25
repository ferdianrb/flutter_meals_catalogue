class FoodDetail {
  String idMeal;
  String strMeal;
  String strMealThumb;
  String strInstructions;
  List<String> strIngredients;

  FoodDetail(
      {this.idMeal,
      this.strMeal,
      this.strMealThumb,
      this.strInstructions,
      this.strIngredients});
  factory FoodDetail.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = List<String>();
    for (int i = 1; i <= 20; i++) {
      String ingredient = json['strIngredient$i'] as String;
      if (ingredient == null) {
        ingredient = "";
      }
      ingredients.add(ingredient);
    }

    return FoodDetail(
        idMeal: json['idMeal'] as String,
        strMeal: json['strMeal'] as String,
        strMealThumb: json['strMealThumb'] as String,
        strInstructions: json['strInstructions'] as String,
        strIngredients: ingredients);
  }
}
