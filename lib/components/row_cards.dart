import 'package:flutter/material.dart';

class CardsScrow extends StatelessWidget {
  const CardsScrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 11, bottom: 16),
      // padding: const EdgeInsets.only(left: 9, right: 9),
      height: 165,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, right: 7),
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
            margin: const EdgeInsets.symmetric(horizontal: 7),
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
            margin: const EdgeInsets.only(left: 7, right: 16),
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
