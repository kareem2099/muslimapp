import 'package:flutter/material.dart';
import 'package:muslimapp/models/horizontal_list.dart';
import 'package:muslimapp/models/languageScreen.dart'; // Assuming the name of the language selection page is LanguageSelectorPage

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/tra/home.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HorizontalListButtons(),
                  SizedBox(height: 20), // Add some spacing
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LanguageSelectionPage()),
                      );
                    },
                    child: Text(
                      'Change Language',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
