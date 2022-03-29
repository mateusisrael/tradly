import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String title;
  final price;
  final String image;

  const ProductCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.price,
      required this.image})
      : super(key: key);

  static const double borderRadiusValue = 10;
  static const BorderSide cardBorder = BorderSide(
      color: Color.fromRGBO(0, 0, 0, 0.1), width: 1, style: BorderStyle.solid);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(right: 10, left: 10),
      width: 160,
      height: 500,
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
              top: cardBorder,
              right: cardBorder,
              bottom: cardBorder,
              left: cardBorder),
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusValue))),
      child: Column(
        children: [
          Container(
            child: Image.network(image),
            height: 127,
            decoration: const BoxDecoration(
                // image: DecorationImage(
                //     image: Image.network('htttp://localhost:300', scale: ,), fit: BoxFit.contain),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderRadiusValue),
                    topRight: Radius.circular(borderRadiusValue))),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    alignment: AlignmentDirectional.topStart,
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      'title',
                      style: const TextStyle(
                          color: Color(0xff4A4A4A), fontSize: 14),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(borderRadiusValue))),
                            child: const Center(
                              child: Text(
                                'T',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const Text(
                            'Tradly',
                            style: TextStyle(
                                color: Color.fromRGBO(79, 79, 79, .5),
                                fontSize: 14),
                          )
                        ],
                      ),
                      Text(
                        "\$$price",
                        style: const TextStyle(
                            color: Color(0xff33907C),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
