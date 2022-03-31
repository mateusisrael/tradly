import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:material_tradly/components/product_card.dart';
import 'package:material_tradly/components/sub_status_bar.dart';
import 'package:http/http.dart' as http;

class Product {
  final int id;
  final String title;
  final price;
  final String image;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.image});
}

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  late Future<List<Product>> products;

  Future<List<Product>> _fetchProducts() async {
    final productsUri =
        Uri(host: 'fakestoreapi.com', path: '/products', scheme: 'https');

    var response = await http.get(productsUri);

    List<Product> productsList = [];

    var serializedResponseBody = jsonDecode(response.body);

    for (var i = 0; i < serializedResponseBody.length; i++) {
      var productJson = serializedResponseBody[i];
      // final productJson = jsonDecode(response.body[i]);

      final serializedProduct = Product(
          id: productJson['id'],
          title: productJson['title'],
          price: productJson['price'],
          image: productJson['image']);

      productsList.add(serializedProduct);
    }

    return productsList;
  }

  @override
  void initState() {
    super.initState();
    products = _fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  return const Text('Algo deu errado');
                }

                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
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
