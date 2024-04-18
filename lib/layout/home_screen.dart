import 'package:flutter/material.dart';
import 'package:muslimapp/models/navigation_screen.dart';
import 'package:flutter_translate/flutter_translate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _hideRail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate('plural.home.home_page')),
        leading: IconButton(
          icon: Icon(_hideRail ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _hideRail = !_hideRail; // Toggle the hideRail state
            });
          },
        ),
      ),
      body: MyNavigationRail(hideRail: _hideRail),
    );
  }
}
