import 'package:flutter/material.dart';
import 'package:material_tradly/components/row_cards.dart';
import 'package:material_tradly/components/search_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  _gridContent(String imagePath, String title) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff000000),
          image: DecorationImage(
              opacity: 0.7,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              image: AssetImage(imagePath))),
      width: 90,
      height: 90,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xffffffff)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubStatusBar(),
        const CardsScrow(),
        GridView.count(
          primary: false,
          shrinkWrap: true,
          // padding: const EdgeInsets.all(20),
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: 4,
          children: [
            _gridContent('images/beverages.jpeg', 'Beverages'),
            _gridContent('images/bread-and-bakery.jpeg', 'Bread & Bakery'),
            _gridContent('images/vegetables.jpeg', 'Vegetables'),
            _gridContent('images/fruit.jpeg', 'Fruit'),
            _gridContent('images/egg.jpeg', 'Egg'),
            _gridContent('images/frozen-veg.jpeg', 'Frozen veg'),
            _gridContent('images/home-care.jpeg', 'Homecare'),
            _gridContent('images/pet-care.jpeg', 'Pet Care'),
          ],
        )
      ],
    );
  }
}

class SubStatusBar extends StatelessWidget {
  const SubStatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final primaryColor = Theme.of(context).primaryColor;
    return Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Column(children: const [SearchBar()]));
  }
}
