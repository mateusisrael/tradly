import 'package:flutter/material.dart';

class ErrorContainer extends StatelessWidget {
  final String text;
  final TextButton textButton;
  const ErrorContainer({Key? key, required this.text, required this.textButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 27),
        child: Column(children: [Text(text), textButton]),
      ),
    );
  }
}
