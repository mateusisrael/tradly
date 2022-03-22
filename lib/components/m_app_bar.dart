import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MAppBar extends StatelessWidget {
  final String title;
  const MAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        toolbarHeight: 84,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_rounded))
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ));
  }
}

mAppBar(title) {
  return AppBar(
      elevation: 0,
      toolbarHeight: 84,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.shopping_cart_rounded))
      ],
      systemOverlayStyle: SystemUiOverlayStyle.light,
      title: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ));
}
