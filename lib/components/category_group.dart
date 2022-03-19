import 'package:flutter/material.dart';

class CategoryGroup extends StatelessWidget {
  final bool? hasBackgroundColor;
  final String title;

  const CategoryGroup(
      {Key? key, this.title = '', this.hasBackgroundColor = false})
      : super(key: key);

  _box() {
    const double borderRadiusValue = 10;
    const BorderSide cardBorder = BorderSide(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        width: 1,
        style: BorderStyle.solid);
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      width: 160,
      height: 300,
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
              top: cardBorder,
              right: cardBorder,
              bottom: cardBorder,
              left: cardBorder),
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusValue))),
      child: Column(
        children: [
          Container(
            height: 127,
            decoration: const BoxDecoration(
                color: Colors.black12,
                image: DecorationImage(
                    image: AssetImage('images/fish.png'), fit: BoxFit.contain),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderRadiusValue),
                    topRight: Radius.circular(borderRadiusValue))),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    alignment: AlignmentDirectional.topStart,
                    padding: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      'Fish',
                      style: TextStyle(color: Color(0xff4A4A4A), fontSize: 14),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(borderRadiusValue))),
                            child: const Center(
                              child: Text(
                                'T',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const Text(
                            'Tradly',
                            style: TextStyle(
                                color: Color.fromRGBO(79, 79, 79, .5),
                                fontSize: 14),
                          )
                        ],
                      ),
                      const Text(
                        '\$25',
                        style: TextStyle(
                            color: Color(0xff33907C),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
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
                    height: 210,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _box(),
                        _box(),
                        _box(),
                        _box(),
                        _box(),
                        _box()
                      ],
                    ))
              ],
            )
          ],
        )));
  }
}
