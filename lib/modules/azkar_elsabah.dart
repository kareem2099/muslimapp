import 'package:flutter/material.dart';
import 'package:muslimapp/models/azkar_elsabah_model.dart';

class AzkarElsabah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('أذكار الصباح'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MorningAdhkarScreen()),
            );
          },
          child: Text('Open Morning Adhkar'),
        ),
      ),
    );
  }
}
