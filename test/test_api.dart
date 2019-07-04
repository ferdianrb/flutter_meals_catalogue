import 'package:meals_catalogue/model/food.dart';
import 'package:meals_catalogue/view/dessert_list.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MockClient extends Mock implements http.Client {}

main() {
  group('Test Api', () {
    final dataJson = {
      'meals': [
        {
          'strMeal': "Apple & Blackberry Crumble",
          'strMealThumb': "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
          'idMeal': "52893"
          },
      ]
    };

    test('menampilkan api get dessert', () async {
      final client = MockClient();
      when(client.get(
              'https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert'))
          .thenAnswer((_) async => http.Response(json.encode(dataJson), 200));
          expect(await fetchDessert(client), isInstanceOf<Food>());
    });
  });
}
