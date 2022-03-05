import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [SubStatusBar()],
    );
  }
}

class SubStatusBar extends StatelessWidget {
  const SubStatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
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
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            height: 46,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.white,
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.search,
                  color: Color(0xff33907C),
                  size: 24,
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(left: 22),
                  child: TextField(
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(79, 79, 79, 0.2),
                          fontSize: 14,
                        ),
                        hintText: 'Search campaign',
                        border: InputBorder.none),
                  ),
                ))
              ],
            ),
          ),
        ]));
  }
}
