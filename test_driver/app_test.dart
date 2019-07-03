import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(){
  group('Homepage', (){
    final foodCategorySeafood = find.byValueKey('seafood');
    final foodCategoryDessert = find.byValueKey('dessert');
    final favorite = find.byValueKey('favorite');

    FlutterDriver driver;

    setUpAll(() async{
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async{
      if (driver!=null){
        driver.close();
      }
    });
    test('Show Category Seafood', () async{
      expect(await driver.getText(foodCategorySeafood), "Seafood");
    });
    test('Show Category Dessert', () async{
      expect(await driver.getText(foodCategoryDessert), "Dessert");
    });
    test('Show Favorite', () async{
      expect(await driver.getText(favorite), "Favorite");
    });
  });
}