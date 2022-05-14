import 'package:flutter/material.dart';
import 'package:material_tradly/components/category_group.dart';
import 'package:material_tradly/components/row_cards.dart';
import 'package:material_tradly/components/sub_status_bar.dart';
import 'package:material_tradly/components/grid_content.dart';

import '../types/product.dart';
import '../utils/fetch.dart';

class GridCell {
  final String imgPath;
  final String title;
  GridCell(this.imgPath, this.title);
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Product>> newProducts;
  late Future<List<Product>> popularProducts;

  @override
  void initState() {
    super.initState();

    newProducts = fetchProducts();
    popularProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final gridContentArray = [
      GridCell('images/beverages.jpeg', 'Beverages'),
      GridCell('images/bread-and-bakery.jpeg', 'Bread & Bakery'),
      GridCell('images/vegetables.jpeg', 'Vegetables'),
      GridCell('images/fruit.jpeg', 'Fruit'),
      GridCell('images/egg.jpeg', 'Egg'),
      GridCell('images/frozen-veg.jpeg', 'Frozen veg'),
      GridCell('images/home-care.jpeg', 'Homecare'),
      GridCell('images/pet-care.jpeg', 'Pet Care'),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SubStatusBar(),
            const CardsScrow(),
            GridView.count(
                primary: false,
                shrinkWrap: true,
                // padding: const EdgeInsets.all(20),
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                crossAxisCount: 4,
                children: gridContentArray
                    .map((i) => GridContent(imgPath: i.imgPath, title: i.title))
                    .toList()),
            FutureBuilder<List<Product>>(
                future: newProducts,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CategoryGroup(
                      products: snapshot.data!,
                      title: 'New Product',
                    );
                  } else if (snapshot.hasError) {
                    return const Text(
                        'Ops, houve um erro ao tentar carregar o conteúdo!');
                  }
                  return const LoadingContainer();
                }),

            FutureBuilder<List<Product>>(
                future: popularProducts,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CategoryGroup(
                      products: snapshot.data!,
                      title: 'Popular Products',
                    );
                  } else if (snapshot.hasError) {
                    return const ErrorContainer(
                        text:
                            'Ops, houve um erro ao tentar carregar o conteúdo!');
                  }
                  return const LoadingContainer();
                }),

            // const CategoryGroup(title: 'Popular Product'),
            Container(
              height: 90,
            )
          ],
        ),
      ),
    );
  }
}

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Container(
        margin: const EdgeInsets.only(top: 27),
        color: Colors.black26,
      ),
    );
  }
}

class ErrorContainer extends StatelessWidget {
  final String text;
  const ErrorContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 27),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
