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
    const double paddingBetweenCards = 6;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ))
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
                              _ImgContainer(imgUrl: productData.photoUrl),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: paddingBetweenCards),
                                child: _MainDetails(
                                    title: productData.name,
                                    price: productData.price.toString()),
                              ),
                              _textContainer(),
                            ],
                          ),
                        ),
                      )),
                  const _BottomBar(),
                ],
              )),
    );
  }
}

_textContainer() {
  const text =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lobortis cras placerat diam ipsum ut. Nisi vel adipiscing massa bibendum diam. Suspendisse mattis dui maecenas duis mattis. Mattis aliquam at arcu, semper nunc, venenatis et pellentesque eu. Id tristique maecenas tristique habitasse eu elementum sed. Aliquam eget lacus, arcu, adipiscing eget feugiat in dolor sagittis.Non commodo, a justo massa porttitor sed placerat in. Orci tristique etiam tempus sed. Mi varius morbi egestas dictum tempor nisl. In ";

  return Container(
    color: Colors.white,
    padding: const EdgeInsets.only(
      top: 61,
      bottom: 45,
      left: 30,
      right: 30,
    ),
    child: const Text(
      text,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xff4F4F4F),
          height: 2),
    ),
  );
}

class _MainDetails extends StatelessWidget {
  final String title;
  final String price;
  const _MainDetails({Key? key, required this.title, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 13),
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xff4F4F4F),
                  fontSize: 18),
            ),
          ),
          Text(
            "\$$price",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor,
                fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class _ImgContainer extends StatelessWidget {
  final String imgUrl;
  const _ImgContainer({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.66 / 1,
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imgUrl)))),
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(58, 76, 130, 0.2),
                offset: Offset(0, -19),
                blurRadius: 38),
          ]),
          child: Container(
            color: Colors.white,
            padding:
                const EdgeInsets.only(top: 12, left: 32, right: 32, bottom: 20),
            child: TextButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size.infinite),
                    fixedSize: MaterialStateProperty.all(const Size(311, 48)),
                    textStyle: MaterialStateProperty.all(const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24)))),
                    // fixedSize:
                    //     MaterialStateProperty.all(const Size(87, 23)),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor)),
                onPressed: () {},
                child: const Text(
                  'Add To Cart',
                  style: TextStyle(color: Colors.white),
                )),
          )),
    );
  }
}
