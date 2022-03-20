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
            child: Padding(
              padding: const EdgeInsets.only(top: 51, left: 17, right: 80),
              child: Column(
                children: [
                  Text('Ready to deliver to your home'.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          color: Colors.white))
                ],
              ),
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
                  image: AssetImage('images/comer-saudavel.jpg'),
                  opacity: 0.6),
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 51, left: 17, right: 80),
              child: Column(
                children: [
                  Text('Ready to deliver to your home'.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          color: Colors.white))
                ],
              ),
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
                  image: AssetImage('images/comer-saudavel2.jpg'),
                  opacity: 0.6),
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 51, left: 17, right: 80),
              child: Column(
                children: [
                  Text('Ready to deliver to your home'.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          color: Colors.white))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
