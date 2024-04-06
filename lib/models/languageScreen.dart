import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:muslimapp/layout/home_screen.dart';

class LanguageSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate('plural.language_selection.title')),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('English'),
            onTap: () {
              changeLocale(context, 'en_US');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          ListTile(
            title: Text('العربية'),
            onTap: () {
              changeLocale(context, 'ar');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          ListTile(
            title: Text('русский'),
            onTap: () {
              changeLocale(context, 'ru');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
