import 'dart:async';
import 'package:flutter/material.dart';
import 'package:muslimapp/layout/home_screen.dart'; // Import your HomeScreen or any other screen you want to navigate to after the splash screen.

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization logic here (e.g., fetching data, checking authentication, etc.)
    // For demonstration purposes, I'm using a delayed Future to simulate loading time.
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              const HomeScreen(), // Replace with your desired screen
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Customize the background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Animation.gif',
              width: 200, // Adjust width as needed
              height: 200, // Adjust height as needed
            ),
            const SizedBox(height: 20),
            const Text(
              "Muslim App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xfff1d275), // Customize the text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
