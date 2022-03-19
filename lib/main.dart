import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'themes/default_theme.dart';
import 'components/bottom_navigation_bar.dart';
import 'screens/home.dart';

void main() {
  runApp(const TradlyApp());
}

class TradlyApp extends StatelessWidget {
  const TradlyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0xff33907C)
            // systemNavigationBarColor: const Color(0xff33907C)));
            ));

    return MaterialApp(
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
      title: 'Tradly',
      home: Scaffold(
        appBar: AppBar(
            elevation: 0,
            toolbarHeight: 84,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_rounded))
            ],
            systemOverlayStyle: SystemUiOverlayStyle.light,
            title: const Text(
              'Groceries',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
        bottomNavigationBar: const AppBottomNavigationBar(),
        body: const Home(),
      ),
    );
  }
}
