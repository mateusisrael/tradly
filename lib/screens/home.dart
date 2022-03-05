import 'package:flutter/material.dart';
import 'package:material_tradly/components/row_cards.dart';
import 'package:material_tradly/components/search_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [SubStatusBar(), CardsScrow()],
    );
  }
}

class SubStatusBar extends StatelessWidget {
  const SubStatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final primaryColor = Theme.of(context).primaryColor;
    return Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Column(children: const [SearchBar()]));
  }
}
