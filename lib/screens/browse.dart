import 'package:flutter/material.dart';
import 'package:material_tradly/components/product_card.dart';
import 'package:material_tradly/components/sub_status_bar.dart';

import '../components/error_container.dart';
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
                                title: product.name,
                                price: product.price,
                                image: product.photoUrl,
                                vendorUrl: product.vendorUrl,
                                categoryUrl: product.categoryUrl,
                              ))
                          .toList());
                } else if (snapshot.hasError) {
                  return ErrorContainer(
                    text: 'Ops, houve um erro ao tentar carregar o conteúdo!',
                    textButton: TextButton(
                        onPressed: () {
                          setState(() {
                            products = fetchProducts();
                          });
                        },
                        child: const Text('Reload')),
                  );
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
    );
  }
}
