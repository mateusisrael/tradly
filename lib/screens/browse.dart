import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:material_tradly/components/product_card.dart';
import 'package:material_tradly/components/sub_status_bar.dart';
import 'package:http/http.dart' as http;

class Product {
  final int id;
  final String title;
  final double price;
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
  late Future<Product> product;

  Future<Product> _fetchProducts() async {
    final productsUri =
        Uri(host: 'fakestoreapi.com', path: '/products/1', scheme: 'https');

    var response = await http.get(productsUri);
    print('RESPONSE $response.body');

    final productJson = jsonDecode(response.body);
    final p = Product(
        id: productJson['id'],
        title: productJson['title'],
        price: productJson['price'],
        image: productJson['image']);

    return p;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product = _fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SubStatusBar(),
            FutureBuilder<Product>(
              future: product,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ProductCard(
                      id: snapshot.data!.id,
                      title: snapshot.data!.title,
                      price: snapshot.data!.price,
                      image: snapshot.data!.image);
                } else if (snapshot.hasError) {
                  const Text('Error');
                }

                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
