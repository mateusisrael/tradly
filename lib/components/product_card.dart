import 'package:flutter/material.dart';
import 'package:material_tradly/components/image_error_builder.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String title;
  final price;
  final String image;
  final bool imageMargin;

  const ProductCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.price,
      required this.image,
      this.imageMargin = false})
      : super(key: key);

  static const double borderRadiusValue = 10;
  static const BorderSide cardBorder = BorderSide(
      color: Color.fromRGBO(0, 0, 0, 0.1), width: 1, style: BorderStyle.solid);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2 / 3,
      child: Container(
        alignment: AlignmentDirectional.bottomCenter,
        // margin: const EdgeInsets.only(right: 10, left: 10),
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                top: cardBorder,
                right: cardBorder,
                bottom: cardBorder,
                left: cardBorder),
            borderRadius: BorderRadius.all(Radius.circular(borderRadiusValue))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: Image.network(image,
                    frameBuilder: (BuildContext context, Widget child,
                        int? frame, bool wasSynchronouslyLoaded) {
                      if (wasSynchronouslyLoaded) {
                        return child;
                      }
                      return AnimatedOpacity(
                        opacity: frame == null ? 0 : 1,
                        duration: const Duration(seconds: 1),
                        child: child,
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => imageError()),
                margin: imageMargin
                    ? const EdgeInsets.all(10)
                    : const EdgeInsets.all(0),
                // height: 127,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(borderRadiusValue),
                        topRight: Radius.circular(borderRadiusValue))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    alignment: AlignmentDirectional.topStart,
                    padding: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      "title",
                      style: TextStyle(color: Color(0xff4A4A4A), fontSize: 14),
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
            )
          ],
        ),
      ),
    );
  }
}
