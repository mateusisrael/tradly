import 'package:flutter/material.dart';

imageError() {
  return Container(
    alignment: AlignmentDirectional.center,
    padding: const EdgeInsets.all(5),
    color: Colors.red[200],
    child: const Text(
      'Ops! Houve um erro ao carregar a imagem',
      style: TextStyle(color: Colors.white),
    ),
  );
}
