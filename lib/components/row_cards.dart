import 'package:flutter/material.dart';

class CardsScrow extends StatelessWidget {
  const CardsScrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 11, bottom: 11),
      height: 165,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: 302,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment.topLeft,
                image: AssetImage('images/card1.jpeg'),
              ),
              color: Colors.deepOrange[200],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: 302,
            color: Colors.brown[200],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: 302,
            color: Colors.green[200],
          )
        ],
      ),
    );
  }
}
