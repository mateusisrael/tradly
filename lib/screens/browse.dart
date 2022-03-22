import 'package:flutter/material.dart';
import 'package:material_tradly/components/bottom_navigation_bar.dart';
import 'package:material_tradly/components/m_app_bar.dart';
import 'package:material_tradly/components/sub_status_bar.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mAppBar('Browse'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SubStatusBar(),
            Center(
              child: Text('Browse'),
            )
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: 1,
      ),
    );
  }
}
