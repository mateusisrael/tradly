import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 144, 97, 153),
      child: const Text('Aqui foi'),
    );
  }
}
