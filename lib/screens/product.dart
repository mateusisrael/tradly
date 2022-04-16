import 'package:flutter/material.dart';

import '../types/product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final productData = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.share),
          Icon(Icons.favorite),
          Icon(Icons.more_vert)
        ],
      ),
      body: LayoutBuilder(
          builder: (context, constraints) => Column(
                children: [
                  Container(
                      color: const Color(0xffE5E5E5),
                      height: constraints.maxHeight - 88,
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              AspectRatio(
                                aspectRatio: 1.66 / 1,
                                child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                productData.photoUrl)))),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.only(
                            top: 12, left: 32, right: 32, bottom: 20),
                        child: TextButton(
                            style: ButtonStyle(
                                minimumSize:
                                    MaterialStateProperty.all(Size.infinite),
                                fixedSize: MaterialStateProperty.all(
                                    const Size(311, 48)),
                                textStyle: MaterialStateProperty.all(
                                    const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                                shape: MaterialStateProperty.all(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24)))),
                                // fixedSize:
                                //     MaterialStateProperty.all(const Size(87, 23)),
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor)),
                            onPressed: () {},
                            child: const Text(
                              'Add To Cart',
                              style: TextStyle(color: Colors.white),
                            ))),
                  )
                ],
              )),
    );
  }
}
