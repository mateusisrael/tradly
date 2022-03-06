import 'package:flutter/material.dart';

class CardsScrow extends StatelessWidget {
  const CardsScrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 11),
      padding: const EdgeInsets.only(left: 9, right: 9),
      height: 165,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 7),
            width: 302,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
                  image: AssetImage('images/card1.jpeg'),
                  opacity: 0.6),
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 7),
            width: 302,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
                  image: AssetImage('images/card1.jpeg'),
                  opacity: 0.6),
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 7),
            width: 302,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft,
                  image: AssetImage('images/card1.jpeg'),
                  opacity: 0.6),
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
