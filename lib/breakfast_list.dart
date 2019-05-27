import 'main.dart';
import 'package:flutter/material.dart';
import 'package:meals_catalogue/detail_screen.dart';

class Breakfast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                duration: Duration(seconds: 1),
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
  Food(
      name: 'Grillades',
      pic: 'assets/grillades.jpg',
      desc:
          'Grillades are medallions of various meats, conventionally beef, but veal and pork are also used in modern recipes. Often served with gravy at breakfast or brunch over grits, they are a traditional Creole food. n\ Despite the name, grillades are not grilled, but fried or seared. For grillades with gravy, the meat is cut into medallions, pounded flat, seasoned and dredged in flour. The meat is then browned and braised in a flavorful liquid made up of roux and chopped or crushed tomatoes. The trinity (chopped bell pepper, onion and celery), garlic, beef broth and/or wine are called for in many recipes. Thyme, bay leaves and cayenne or hot sauce are common seasonings. The braising liquid is used as a gravy for the finished dish.'),
  Food(
      name: 'Kulcha',
      pic: 'assets/kulcha.jpg',
      desc:
          'Kulcha is a type of mildly leavened flatbread that originated in the Indian subcontinent. Kulcha is made from maida flour, water, a pinch of salt and a leavening agent (yeast or old kulcha dough), mixed together by hand to make a very tight dough. This dough is covered with a wet cloth and left to stand for an hour or so in a warm place. The result is a slight leavening of the flour but not much. The flour is pummelled again by hand and then rolled out using a rolling pin into a flat, round shape. It is baked in an earthen clay oven (tandoor) until done. When baked, it is often brushed with butter or ghee, although this is not necessary. It is then eaten with any Indian curry. In particular, a spicy chickpea curry known as chole is the dish of choice for being eaten with kulcha.'),
  Food(
      name: 'Mandoca',
      pic: 'assets/mandocha.jpg',
      desc:
          'A mandoca is a Venezuelan deep fried cornmeal ring that is usually eaten with butter and cheese while still hot. It is usually served at breakfast, and it is most popular in Zulia state of the country. The mandoca is one of a variety of specialties exclusively created in the western state of Zulia. Though their relevance has been shaded by the new transnational tendencies because its creation was not intended for massive consumption or for marketing, it remains a basic and important part of the culinary culture of Zulia. It is made of corn meal, water, salt, grated queso blanco (hard, salty, white cheese), sugar or panela (jaggery, used in most traditional recipes), and very ripe plantain.'),
  Food(
      name: 'Mie Goreng',
      pic: 'assets/mie_goreng.jpg',
      desc:
          'Mie goreng (Indonesian: mie goreng or mi goreng; Malay: mee goreng or mi goreng; both meaning fried noodles), also known as bakmi goreng, is an often spicy fried noodle dish, originating from Southeast Asia, common in Indonesia, Malaysia, Brunei Darussalam, and Singapore. It is made with thin yellow noodles fried in cooking oil with garlic, onion or shallots, fried prawn, chicken, beef, or sliced bakso (meatballs), chili, Chinese cabbage, cabbages, tomatoes, egg, and other vegetables. Ubiquitous in Indonesia, it can be found everywhere in the country, sold by all food vendors from street-hawkers, warungs, to high-end restaurants. It is an Indonesian one-dish meal favourite, although street food hawkers commonly sell it together with nasi goreng (fried rice). It is commonly available at Mamak stalls in Singapore, Brunei Darussalam, and Malaysia and is often spicy. In Sri Lanka, mee goreng is a popular dish due to Malay cultural influences and is sold at street food stalls around the country.'),
  Food(
      name: 'Nasi Goreng',
      pic: 'assets/nasi_goreng.jpg',
      desc:
          'Nasi goreng (English pronunciation: /ˌnɑːsi ɡɒˈrɛŋ/), literally meaning fried rice in both the Malay and Indonesian languages, is an Indonesian rice dish with pieces of meat and vegetables added. It can refer simply to fried pre-cooked rice, a meal including stir fried rice in a small amount of cooking oil or margarine, typically spiced with kecap manis (sweet soy sauce), shallot, garlic, ground shrimp paste, tamarind and chilli and accompanied by other ingredients, particularly egg, chicken and prawns. There is also another kind of nasi goreng which is made with ikan asin (salted dried fish) which is also popular across Indonesia. Nasi goreng is sometimes described as Indonesian stir-fried rice, although it is also popular in Southeast Asia. Beyond the Malay Archipelago, it has gained popularity through Indonesian influence in Sri Lanka and via Indonesian immigrant communities in Suriname and the Netherlands. It is distinguished from other Asian fried rice recipes by its aromatic, earthy and smoky flavor, owed to generous amount of caramelized sweet soy sauce and powdered shrimp paste, and the taste is stronger and spicier compared to Chinese fried rice.'),
  Food(
      name: 'Nasi Lemak',
      pic: 'assets/nasi_lemak.jpg',
      desc:
          'Nasi lemak is a Malay fragrant rice dish cooked in coconut milk and pandan leaf. It is commonly found in Malaysia, where it is considered the national dish; it is also the native dish in neighbouring areas with significant Malay populations such as Singapore; Brunei, and Southern Thailand. In Indonesia it can be found in several parts of Sumatra; especially Malay realm of Riau, Riau Islands and Medan. Nasi lemak can also be found in the Bangsamoro region of Mindanao prepared by Filipino Moro. It is considered one of the most famous dishes for a Malay-style breakfast. It is not to be confused with nasi dagang, sold in the Malaysian east coast states of Terengganu and Kelantan (and its kindred region in Pattani, Yala and Narathiwat in Thailand and Natuna in Indonesia), although both dishes are often served for breakfast. However, because nasi lemak can be served in a variety of ways, it is often eaten throughout the day.'),
  Food(
      name: 'Pancake',
      pic: 'assets/pancake.jpg',
      desc:
          'A pancake (or hotcake, griddlecake, or flapjack) is a flat cake, often thin and round, prepared from a starch-based batter that may contain eggs, milk and butter and cooked on a hot surface such as a griddle or frying pan, often frying with oil or butter. Archaeological evidence suggests that pancakes were probably the earliest and most widespread cereal food eaten in prehistoric societies.'),
];
