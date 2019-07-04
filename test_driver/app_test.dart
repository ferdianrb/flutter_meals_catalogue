import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Homepage', () {
    final foodCategorySeafood = find.byValueKey('seafood');
    final foodCategoryDessert = find.byValueKey('dessert');
    final favorite = find.byValueKey('favorite');
    final detailFood1 = find.byValueKey('detail_seafood1');
    final tabSeafood = find.byValueKey('tab_seafood');
    final tabDessert = find.byValueKey('tab_dessert');
    final tabFavorite = find.byValueKey('tab_favorite');
    final buttonFav = find.byValueKey('add_fav');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test('Show Category Seafood', () async {
      expect(await driver.getText(foodCategorySeafood), "Seafood");
    });
    test('Show Category Dessert', () async {
      expect(await driver.getText(foodCategoryDessert), "Dessert");
    });
    test('Show Favorite', () async {
      expect(await driver.getText(favorite), "Favorite");
    });
    test('click Tab Seafood', () async {
      await driver.tap(tabSeafood);
    });
    test('click Detail Food 1', () async {
      await driver.tap(detailFood1);
    });
    // test('click Tab Dessert', () async {
    //   await driver.tap(tabDessert);
    // });
    // test('click Tab Favorite', () async {
    //   await driver.tap(tabFavorite);
    // });

    // test('add favorite', () async {
    //   await driver.tap(buttonFav);
    // });
  });
}
