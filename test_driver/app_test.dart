import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Meals Test', () {
    final detailFood1 = find.byValueKey('detail_seafood1');
    final detailDessertFood1 = find.byValueKey('detail_dessert1');
    final tabSeafood = find.byValueKey('tab_seafood');
    final tabDessert = find.byValueKey('tab_dessert');
    final buttonBack = find.byTooltip('back');
    final buttonSearch = find.byTooltip("search");
    final inputSearch = find.byValueKey('search_input');

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
      await driver.tap(buttonBack);
    });
    test('Dessert', () async {
      await driver.tap(tabDessert);
      await driver.tap(detailDessertFood1);
      await driver.tap(buttonBack);
    });
    test('Search Food', () async {
      await driver.tap(buttonSearch);
      await driver.tap(inputSearch);
      await driver.enterText("salmon");
      await driver.tap(buttonBack);
    });
  });
}
