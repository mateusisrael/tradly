import 'package:flutter/material.dart';

class CategoryGroup extends StatelessWidget {
  final bool? hasBackgroundColor;
  final String title;

  const CategoryGroup(
      {Key? key, this.title = '', this.hasBackgroundColor = false})
      : super(key: key);

  _box() {
    const BorderSide cardBorder = BorderSide(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        width: 1,
        style: BorderStyle.solid);
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      width: 160,
      height: 200,
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
              top: cardBorder,
              right: cardBorder,
              bottom: cardBorder,
              left: cardBorder),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  Text _renderText() {
    if (hasBackgroundColor != null && hasBackgroundColor == true) {
      return Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            color: Color(0xffffffff),
            fontWeight: FontWeight.bold),
      );
    } else {
      return Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            color: Color(0xff4F4F4F),
            fontWeight: FontWeight.bold),
      );
    }
  }

  Color _renderButtonColor(Color primaryColor) {
    if (hasBackgroundColor != null && hasBackgroundColor == true) {
      return const Color(0xffffffff);
    }
    return primaryColor;
  }

  Color _renderButtonTextColor(Color primaryColor) {
    final buttonTextColorIsPrimary =
        hasBackgroundColor != null && hasBackgroundColor == true;
    if (buttonTextColorIsPrimary) {
      return primaryColor;
    }

    return const Color(0xffffffff);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SizedBox(
            // height: 260,
            child: Stack(
          children: [
            if (hasBackgroundColor == true)
              Container(height: 184, color: Theme.of(context).primaryColor),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 22, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _renderText(),
                      TextButton(
                          style: ButtonStyle(
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(fontSize: 12)),
                              shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(24)))),
                              fixedSize:
                                  MaterialStateProperty.all(const Size(87, 23)),
                              backgroundColor: MaterialStateProperty.all(
                                  _renderButtonColor(
                                      Theme.of(context).primaryColor))),
                          onPressed: () {},
                          child: Text(
                            'View all',
                            style: TextStyle(
                                color: _renderButtonTextColor(
                                    Theme.of(context).primaryColor)),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                    // color: Colors.amber[100],
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [_box(), _box(), _box(), _box()],
                    ))
              ],
            )
          ],
        )));
  }
}
