import 'dart:convert';
import '../types/product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProducts({int offset = 0, int? limit}) async {
  final productsUri = Uri.parse('https://fakestoreapi.com/products'
      '?offset=${offset.toString()}'
      '&limit=${limit.toString()}');

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
