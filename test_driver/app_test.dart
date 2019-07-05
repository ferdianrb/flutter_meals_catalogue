import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Meals Test', () {
    final foodCategorySeafood = find.byValueKey('seafood');
    final foodCategoryDessert = find.byValueKey('dessert');
    final favorite = find.byValueKey('favorite');
    final detailFood1 = find.byValueKey('detail_seafood1');
    final detailDessertFood1 = find.byValueKey('detail_dessert1');
    final tabSeafood = find.byValueKey('tab_seafood');
    final tabDessert = find.byValueKey('tab_dessert');
    final tabFavorite = find.byValueKey('tab_favorite');
    final buttonFav = find.byTooltip('add_fav');
    final buttonBack = find.byTooltip('back');
    final buttonSearch = find.byTooltip("search");
    final inputSearch = find.byValueKey('search_input');
    final foodlist = find.byValueKey('food_list');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test('Seafood', () async {
      await driver.tap(tabSeafood);
      await driver.tap(detailFood1);
      // await driver.tap(buttonFav);
      await driver.tap(buttonBack);
    });
    test('Dessert', () async {
      await driver.tap(tabDessert);
      await driver.tap(detailDessertFood1);
      // await driver.tap(buttonFav);
      await driver.tap(buttonBack);
    });
    test('Search Food', () async {
      await driver.tap(buttonSearch);
      await driver.tap(inputSearch);
      await driver.enterText("salmon");
      await driver.waitFor(foodlist, timeout: Duration(seconds: 15));
      // await driver.tap(buttonFav);
      await driver.tap(buttonBack);
    });
    // test('Show Category Dessert', () async {
    //   expect(await driver.getText(foodCategoryDessert), "Dessert");
    // });
    // test('Show Favorite', () async {
    //   expect(await driver.getText(favorite), "Favorite");
    // });
    // test('click Tab Seafood', () async {
    // });
    // test('click Detail Food 1', () async {
    // });
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
