import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'themes/default_theme.dart';
import 'components/bottom_navigation_bar.dart';
import 'components/m_app_bar.dart';
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
        appBar: mAppBar('Groceries'),
        bottomNavigationBar: const AppBottomNavigationBar(),
        body: const Home(),
      ),
    );
  }
}
