import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: 46,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(58, 76, 130, 0.0722656),
              blurRadius: 38,
              offset: Offset(0, 19))
        ],
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
    );
  }
}
