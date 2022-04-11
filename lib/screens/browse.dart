import 'package:flutter/material.dart';
import 'package:material_tradly/components/product_card.dart';
import 'package:material_tradly/components/sub_status_bar.dart';

import '../types/product.dart';
import '../utils/fetch.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              const SubStatusBar(),
              FutureBuilder<List<Product>>(
                future: products,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
                        padding: const EdgeInsets.only(
                            top: 30, left: 23, right: 23, bottom: 84),
                        crossAxisSpacing: 10,
                        childAspectRatio: 2.2 / 3,
                        mainAxisSpacing: 10,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        children: snapshot.data!
                            .map((product) => ProductCard(
                                imageMargin: true,
                                id: product.id,
                                title: product.title,
                                price: product.price,
                                image: product.image))
                            .toList());
                  } else if (snapshot.hasError) {
                    return const Text(
                        'Ops! Houve um erro ao carregar o conteúdo');
                  }

                  return SizedBox(
                    height: 500,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
