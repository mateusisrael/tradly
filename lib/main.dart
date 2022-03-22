import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_tradly/screens/browse.dart';
import 'themes/default_theme.dart';
import 'components/bottom_navigation_bar.dart';
import 'components/m_app_bar.dart';
import 'screens/home.dart';

void main() {
  runApp(const TradlyApp());
}

class TradlyApp extends StatefulWidget {
  const TradlyApp({Key? key}) : super(key: key);

  @override
  State<TradlyApp> createState() => _TradlyAppState();
}

class _TradlyAppState extends State<TradlyApp> {
  int _currentScreen = 0;

  final _screens = [Home(), BrowseScreen()];

  handleChangeCurrentScreen(int value) {
    if (value < _screens.length) {
      setState(() {
        _currentScreen = value;
      });
    }
  }

  _renderScreen() {
    return _screens[_currentScreen];
  }

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
        body: _renderScreen(),
        bottomNavigationBar: AppBottomNavigationBar(
            currentIndex: _currentScreen,
            changeScreen: handleChangeCurrentScreen),
      ),
    );
  }
}
