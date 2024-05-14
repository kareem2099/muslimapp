import 'dart:convert';

import 'package:flutter/material.dart';

class MorningAdhkarScreen extends StatelessWidget {
  final List<Map<String, dynamic>> azkarElsabah = [
    {
      "id": 1,
      "text": "أَعُوذُ بِاللهِ من الشَّيْطَانِ الرَّجِيمِ",
      "translation": "I seek refuge in Allah from Satan the accursed."
    },
    {
      "id": 2,
      "text": "اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ ...",
      "translation":
          "Allah! There is no deity except Him, the Ever-Living, the Sustainer of [all] existence..."
    },
    // Add the rest of your Azkar El Sabah data here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Azkar El Sabah',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal, // Set the app bar color to teal
      ),
      body: ListView.builder(
        itemCount: azkarElsabah.length,
        itemBuilder: (context, index) {
          final azkar = azkarElsabah[index];
          return ListTile(
            title: Text(
              azkar['text'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(azkar['translation']),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MorningAdhkarScreen(),
  ));
}
