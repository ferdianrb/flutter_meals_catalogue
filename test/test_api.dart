import 'package:meals_catalogue/model/food.dart';
import 'package:meals_catalogue/model/food_detail.dart';
import 'package:meals_catalogue/view/dessert_list.dart';
import 'package:meals_catalogue/view/detail_screen.dart';
import 'package:meals_catalogue/view/search.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MockClient extends Mock implements http.Client {}

main() {
  group('Test Api', () {
    final mealsJson = {
      'meals': [
        {
          'strMeal': "Apple & Blackberry Crumble",
          'strMealThumb':
              "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
          'idMeal': "52893"
        },
      ]
    };

    final searchJson = {
      'meals': [
        {
          'idMeal': "52823",
          'strMeal': "Salmon Prawn Risotto",
          'strDrinkAlternate': null,
          'strCategory': "Seafood",
          'strArea': "Italian",
          'strInstructions':
              "Melt the butter in a thick-based pan and gently cook the onion without colour until it is soft. Add the rice and stir to coat all the grains in the butter Add the wine and cook gently stirring until it is absorbed Gradually add the hot stock, stirring until each addition is absorbed. Keep stirring until the rice is tender Season with the lemon juice and zest, and pepper to taste. (there will probably be sufficient saltiness from the salmon to not need to add salt) Stir gently to heat through Serve scattered with the Parmesan and seasonal vegetables. Grill the salmon and gently place onto the risotto with the prawns and asparagus",
          'strMealThumb':
              "https://www.themealdb.com/images/media/meals/xxrxux1503070723.jpg",
          'strTags': "Fish",
          'strYoutube': "https://www.youtube.com/watch?v=V2PMvBv52IE",
          'strIngredient1': "butter",
          'strIngredient2': "onion",
          'strIngredient3': "rice",
          'strIngredient4': "white wine",
          'strIngredient5': "vegetable stock",
          'strIngredient6': "lemon",
          'strIngredient7': "King Prawns",
          'strIngredient8': "salmon",
          'strIngredient9': "asparagus",
          'strIngredient10': "black pepper",
          'strIngredient11': "Parmesan",
          'strIngredient12': "",
          'strIngredient13': "",
          'strIngredient14': "",
          'strIngredient15': "",
          'strIngredient16': "",
          'strIngredient17': "",
          'strIngredient18': "",
          'strIngredient19': "",
          'strIngredient20': "",
          'strMeasure1': "50g/2oz",
          'strMeasure2': "1 finely chopped ",
          'strMeasure3': "150g",
          'strMeasure4': "125ml ",
          'strMeasure5': "1 litre hot",
          'strMeasure6': "The juice and zest of one",
          'strMeasure7': "240g large",
          'strMeasure8': "150g",
          'strMeasure9': "100g tips blanched briefly in boiling water",
          'strMeasure10': "ground",
          'strMeasure11': "50g shavings",
          'strMeasure12': "",
          'strMeasure13': "",
          'strMeasure14': "",
          'strMeasure15': "",
          'strMeasure16': "",
          'strMeasure17': "",
          'strMeasure18': "",
          'strMeasure19': "",
          'strMeasure20': "",
          'strSource':
              "http://www.rangemaster.co.uk/rangemaster-owners/recipes-ideas-inspiration/recipes/mains/prawn-and-hot-smoked-salmon-risotto-with-asparagus",
          'dateModified': null
        },
      ]
    };

    final detailedMealsJson = {
      'meals': [
        {
          'idMeal': "52823",
          'strMeal': "Salmon Prawn Risotto",
          'strDrinkAlternate': null,
          'strCategory': "Seafood",
          'strArea': "Italian",
          'strInstructions':
              "Melt the butter in a thick-based pan and gently cook the onion without colour until it is soft. Add the rice and stir to coat all the grains in the butter Add the wine and cook gently stirring until it is absorbed Gradually add the hot stock, stirring until each addition is absorbed. Keep stirring until the rice is tender Season with the lemon juice and zest, and pepper to taste. (there will probably be sufficient saltiness from the salmon to not need to add salt) Stir gently to heat through Serve scattered with the Parmesan and seasonal vegetables. Grill the salmon and gently place onto the risotto with the prawns and asparagus",
          'strMealThumb':
              "https://www.themealdb.com/images/media/meals/xxrxux1503070723.jpg",
          'strTags': "Fish",
          'strYoutube': "https://www.youtube.com/watch?v=V2PMvBv52IE",
          'strIngredient1': "butter",
          'strIngredient2': "onion",
          'strIngredient3': "rice",
          'strIngredient4': "white wine",
          'strIngredient5': "vegetable stock",
          'strIngredient6': "lemon",
          'strIngredient7': "King Prawns",
          'strIngredient8': "salmon",
          'strIngredient9': "asparagus",
          'strIngredient10': "black pepper",
          'strIngredient11': "Parmesan",
          'strIngredient12': "",
          'strIngredient13': "",
          'strIngredient14': "",
          'strIngredient15': "",
          'strIngredient16': "",
          'strIngredient17': "",
          'strIngredient18': "",
          'strIngredient19': "",
          'strIngredient20': "",
          'strMeasure1': "50g/2oz",
          'strMeasure2': "1 finely chopped ",
          'strMeasure3': "150g",
          'strMeasure4': "125ml ",
          'strMeasure5': "1 litre hot",
          'strMeasure6': "The juice and zest of one",
          'strMeasure7': "240g large",
          'strMeasure8': "150g",
          'strMeasure9': "100g tips blanched briefly in boiling water",
          'strMeasure10': "ground",
          'strMeasure11': "50g shavings",
          'strMeasure12': "",
          'strMeasure13': "",
          'strMeasure14': "",
          'strMeasure15': "",
          'strMeasure16': "",
          'strMeasure17': "",
          'strMeasure18': "",
          'strMeasure19': "",
          'strMeasure20': "",
          'strSource':
              "http://www.rangemaster.co.uk/rangemaster-owners/recipes-ideas-inspiration/recipes/mains/prawn-and-hot-smoked-salmon-risotto-with-asparagus",
          'dateModified': null
        }
      ]
    };

    final client = MockClient();
    test('menampilkan api get dessert', () async {
      when(client.get(
              'https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert'))
          .thenAnswer((_) async => http.Response(json.encode(mealsJson), 200));
      expect(await fetchDessert(client), isInstanceOf<Food>());
    });

    test('menampilkan api search meals', () async {
      String keyword = "salmon";
      when(client.get(
              'https://www.themealdb.com/api/json/v1/1/search.php?s=$keyword'))
          .thenAnswer((_) async => http.Response(json.encode(searchJson), 200));
      expect(await fetchMealsSearch(client, keyword), isInstanceOf<Food>());
    });

    test('menampilkan api detail meals', () async {
      String mealId = "52823";
      when(client.get(
              'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId'))
          .thenAnswer(
              (_) async => http.Response(json.encode(detailedMealsJson), 200));
      expect(
          await fetchMealsDetail(client, mealId), isInstanceOf<FoodDetail>());
    });
  });
}
