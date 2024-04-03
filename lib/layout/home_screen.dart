import 'package:flutter/material.dart';
import 'package:muslimapp/models/horizontal_list.dart';

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
                  image: AssetImage('assets/home.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HorizontalListButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
