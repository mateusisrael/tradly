import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_tradly/types/product.dart';
import 'screens/browse.dart';
import 'screens/product.dart';
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
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0xff33907C)
            // systemNavigationBarColor: const Color(0xff33907C)));
            ));

    return MaterialApp(
      routes: {
        '/': (context) => const Main(),
        '/product': (context) => const ProductScreen(),
      },
      onGenerateRoute: (context) => null,
      theme: defaultTheme,
      debugShowCheckedModeBanner: false,
      title: 'Tradly',
    );
  }
}

// _onGenerateRoute(RouteSettings settings) {
//   if (settings.name == '/') {
//     return MaterialPageRoute(builder: (context) => const Main());
//   }

//   // Handle /product
//   if (settings.name == '/product') {
//     final args = settings.arguments as Product;

//     return MaterialPageRoute(builder: (context) => const ProductScreen());
//   }
// }

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentScreen = 0;

  final _screens = const [Home(), BrowseScreen()];

  handleChangeCurrentScreen(int value) {
    if (value < _screens.length) {
      setState(() {
        _currentScreen = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mAppBar('Groceries'),
      body: IndexedStack(
        index: _currentScreen,
        children: _screens,
      ),
      bottomNavigationBar: AppBottomNavigationBar(
          currentIndex: _currentScreen,
          changeScreen: handleChangeCurrentScreen),
    );
  }
}
