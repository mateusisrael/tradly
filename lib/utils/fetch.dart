import 'dart:convert';
import '../types/product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProducts({int offset = 0, int? limit}) async {
  const URI = "https://api.predic8.de";
  const BACKUP_IMG =
      'https://igp.rs.gov.br/themes/modelo-noticias/images/outros/GD_imgSemImagem.png';

  final productsUri = Uri.parse("$URI/shop/products/");
  var response = await http.get(productsUri);

  var products = jsonDecode(response.body)["products"];

  var arrayOfRequests = Iterable.generate(products.length,
      (p) => http.get(Uri.parse("$URI${products[p]["product_url"]}")));

  var allProducts = await Future.wait(arrayOfRequests);

  var productsOBJ = [];
  for (var i = 0; i < allProducts.length; i++) {
    productsOBJ.add(jsonDecode(allProducts[i].body));
  }

  List<Product> productsList = [];
  for (var i = 0; i < productsOBJ.length; i++) {
    var productJson = productsOBJ[i];
    // final productJson = jsonDecode(response.body[i]);

    // if(productJson['photo_url'] == null)
    final serializedProduct = Product(
        name: productJson['name'],
        categoryUrl: productJson['category_url'],
        vendorUrl: productJson['vendor_url'],
        price: productJson['price'],
        photoUrl: (productJson['photo_url'] != null)
            ? (URI + productJson['photo_url'])
            : BACKUP_IMG);

    productsList.add(serializedProduct);
  }

  return productsList;
}
