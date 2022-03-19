import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => AppBottomNavigationBarState();
}

class AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  final Color unselectedItemColor = const Color.fromRGBO(79, 79, 79, .5);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: unselectedItemColor,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      selectedFontSize: 10,
      unselectedFontSize: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          label: "Browse",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.store,
          ),
          label: "Store",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list,
          ),
          label: "Orders",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
