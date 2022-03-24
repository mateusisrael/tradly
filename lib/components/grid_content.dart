import 'package:flutter/material.dart';

class GridContent extends StatelessWidget {
  final String imgPath;
  final String title;

  const GridContent({Key? key, required this.imgPath, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xff000000),
            image: DecorationImage(
                opacity: 0.7,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                image: AssetImage(imgPath))),
        width: 90,
        height: 90,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xffffffff)),
        ));
  }
}
