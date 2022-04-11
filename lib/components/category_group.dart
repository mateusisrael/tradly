import 'package:flutter/material.dart';
import 'package:material_tradly/components/product_card.dart';

import '../types/product.dart';

class CategoryGroup extends StatelessWidget {
  final bool? hasBackgroundColor;
  final String title;
  final List<Product> products;

  const CategoryGroup(
      {Key? key,
      this.title = '',
      this.hasBackgroundColor = false,
      required this.products})
      : super(key: key);

  Text _renderText() {
    if (hasBackgroundColor != null && hasBackgroundColor == true) {
      return Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            color: Color(0xffffffff),
            fontWeight: FontWeight.bold),
      );
    } else {
      return Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            color: Color(0xff4F4F4F),
            fontWeight: FontWeight.bold),
      );
    }
  }

  Color _renderButtonColor(Color primaryColor) {
    if (hasBackgroundColor != null && hasBackgroundColor == true) {
      return const Color(0xffffffff);
    }
    return primaryColor;
  }

  Color _renderButtonTextColor(Color primaryColor) {
    final buttonTextColorIsPrimary =
        hasBackgroundColor != null && hasBackgroundColor == true;
    if (buttonTextColorIsPrimary) {
      return primaryColor;
    }

    return const Color(0xffffffff);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SizedBox(
            // height: 260,
            child: Stack(
          children: [
            if (hasBackgroundColor == true)
              Container(height: 184, color: Theme.of(context).primaryColor),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 22, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _renderText(),
                      TextButton(
                          style: ButtonStyle(
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(fontSize: 12)),
                              shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(24)))),
                              fixedSize:
                                  MaterialStateProperty.all(const Size(87, 23)),
                              backgroundColor: MaterialStateProperty.all(
                                  _renderButtonColor(
                                      Theme.of(context).primaryColor))),
                          onPressed: () {},
                          child: Text(
                            'View all',
                            style: TextStyle(
                                color: _renderButtonTextColor(
                                    Theme.of(context).primaryColor)),
                          ))
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    // color: Colors.amber[100],
                    height: 210,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: products
                            .map(
                              (Product product) => Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: ProductCard(
                                    id: product.id,
                                    title: product.title,
                                    price: product.price,
                                    image: product.image),
                              ),
                            )
                            .toList())),
              ],
            )
          ],
        )));
  }
}
