import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:muslimapp/layout/home_screen.dart';

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate('plural.language_selection.title')),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('English'),
            onTap: () {
              changeLocale(context, 'en_US');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('العربية'),
            onTap: () {
              changeLocale(context, 'ar');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('русский'),
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
