import 'package:flutter/material.dart';
import 'package:muslimapp/modules/quran.dart';
import 'package:muslimapp/models/quran_list.dart';

class DailyVerseCard extends StatefulWidget {
  final String verse;
  final String translation;

  const DailyVerseCard({
    Key? key,
    required this.verse,
    required this.translation,
  }) : super(key: key);

  @override
  _DailyVerseCardState createState() => _DailyVerseCardState();
}

class _DailyVerseCardState extends State<DailyVerseCard> {
  late String verse;
  late String translation;

  @override
  void initState() {
    super.initState();
    // Fetch daily verse and translation when the widget is initialized
    fetchDailyVerse();
  }

  // Function to fetch daily verse and translation
  void fetchDailyVerse() {
    Map<String, dynamic> todayVerse = getRandomVerse();
    setState(() {
      verse = todayVerse['verse'];
      translation = todayVerse['translation'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Navigate to the Quran page when the card is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuranPage()),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                verse,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                translation,
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
