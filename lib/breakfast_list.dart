import 'main.dart';
import 'package:flutter/material.dart';
import 'package:meals_catalogue/detail_screen.dart';

class Breakfast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: breakfast.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.grey,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: breakfast[index]),
                ),
              );
              final snackBar = SnackBar(
                duration: Duration(seconds: 2),
                content: Text(breakfast[index].name),
                action: SnackBarAction(
                  textColor: Colors.blue,
                  label: 'Close',
                  onPressed: () {},
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: new Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 14.0,
                  child: Hero(
                    tag: breakfast[index].pic,
                    child: Image.asset(
                      breakfast[index].pic,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                new Expanded(
                  child: Center(
                    child: Text(
                      breakfast[index].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

List<Food> breakfast = <Food>[
  Food(
      name: 'Bacon',
      pic: 'assets/bacon.jpg',
      desc:
          'Bacon is a type of salt-cured pork. Bacon is prepared from several different cuts of meat, typically from the pork belly or from back cuts, which have less fat than the belly. It is eaten on its own, as a side dish (particularly in breakfasts), or used as a minor ingredient to flavour dishes (e.g., the club sandwich). Bacon is also used for barding and larding roasts, especially game, including venison and pheasant. The word is derived from the Old High German bacho, meaning "buttock", "ham" or "side of bacon", and is cognate with the Old French bacon.'),
  Food(
      name: 'Breakfast Sandwich',
      pic: 'assets/sandwich.jpg',
      desc:
          'In North America, a breakfast sandwich is any sandwich filled with foods associated with the breakfast meal. Breakfast sandwiches are served at fast food restaurants (for example, the Burger King breakfast sandwiches) and delicatessens or bought as fast, ready to heat and eat sandwiches from a store. Breakfast sandwiches are commonly made at home. Different types of breakfast sandwich include the bacon sandwich, the egg sandwich, and the sausage sandwich; or various combinations thereof, like the bacon, egg and cheese sandwich. The breakfast sandwich is related to the breakfast roll.'),
  Food(
      name: 'Breakfast Burrito',
      pic: 'assets/burrito.jpg',
      desc:
          'The breakfast burrito, sometimes referred to as a breakfast wrap outside of the American Southwest, is a variety of American breakfast composed of breakfast items wrapped inside a flour tortilla burrito. This style was invented and popularized in several regional American cuisines, most notably originating in New Mexican cuisine, and expanding beyond Southwestern cuisine and neighboring Tex-Mex. Southwestern breakfast burritos may include scrambled eggs, potatoes, onions, chorizo, or bacon.'),
  Food(
      name: 'Cinnamon roll',
      pic: 'assets/cinamon_roll.jpg',
      desc:
          'A cinnamon roll (also cinnamon bun, cinnamon swirl, and cinnamon snail) is a sweet roll served commonly in Northern Europe (mostly in Scandinavia) and North America. In Denmark, it is known as Kanelsnegl; cinnamon snail and is a form of wienerbrød (Vienna Bread). Its main ingredients are flour, cinnamon, sugar, and butter, which provide a robust and sweet flavor.'),
  Food(
      name: 'Egg',
      pic: 'assets/egg.jpg',
      desc:
          'Some eggs are laid by female animals of many different species, including birds, reptiles, amphibians, mammals, and fish, and have been eaten by humans for thousands of years. Bird and reptile eggs consist of a protective eggshell, albumen (egg white), and vitellus (egg yolk), contained within various thin membranes. The most commonly consumed eggs are chicken eggs. Other poultry eggs including those of duck and quail also are eaten. Fish eggs are called roe and caviar.'),
  Food(
      name: 'French Toast',
      pic: 'assets/french_toast.jpg',
      desc:
          'French Toast is a dish made of bread soaked in eggs and milk, then fried. Alternative names and variants include eggy bread Bombay toast, German toast, gypsy toast, poor knights (of Windsor), Eggs-oh-Lay and Torrija.'),
  Food(
      name: 'Hamburger',
      pic: 'assets/hamburger.jpg',
      desc:
          'A hamburger (short: burger) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, or flame broiled. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chiles; condiments such as ketchup, mayonnaise, mustard, relish, or "special sauce"; and are frequently placed on sesame seed buns. A hamburger topped with cheese is called a cheeseburger.'),
  Food(
      name: 'Fried Cheese',
      pic: 'assets/fried_cheesse.jpg',
      desc:
          'Fried cheese is a dish prepared using cheese that is fried in oil. Fried cheese can be dipped in a batter before frying, and can be pan-fried or deep fried. It can be served as an appetizer or a snack. Fried cheese is a common food in Brazil, and is typically served as a breakfast dish in Cyprus, Greece, Lebanon, Syria and Turkey. Fried cheese is served as a tapas dish in Spain, and in Spain fried cheese balls is referred to as delicias de queso (English: "Cheese delights"). It is also a dish in Italian cuisine. Fried cheese is typically served hot, right after being cooked. It may be accompanied with a dipping sauce or coated with a dressing.'),
];
