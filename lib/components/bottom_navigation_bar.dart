import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  const AppBottomNavigationBar({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => AppBottomNavigationBarState();
}

class AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  final Color unselectedItemColor = const Color.fromRGBO(79, 79, 79, .5);
  // int selectedInd = 1;
  final screens = ['/', '/browse'];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.currentIndex,
      onTap: (value) => {
        if (value == widget.currentIndex || value > screens.length - 1)
          {}
        else
          {Navigator.pushNamed(context, screens[value])}
      },
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
