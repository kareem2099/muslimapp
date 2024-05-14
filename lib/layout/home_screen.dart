import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:muslimapp/models/daily_verses.dart';
import 'package:muslimapp/models/quran_list.dart';
import 'package:muslimapp/models/navigation_screen.dart';
import 'package:muslimapp/models/azkar_elsabah_model.dart';
import 'package:muslimapp/models/azkar_catagory_card.dart'; // Import the new widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String dailyVerse;
  late String dailyTranslation;
  bool _hideRail = false;
  bool _isRailExtended = false;

  @override
  void initState() {
    super.initState();
    fetchDailyVerse();
  }

  void fetchDailyVerse() {
    Map<String, dynamic> todayVerse = getRandomVerse();
    setState(() {
      dailyVerse = todayVerse['verse'];
      dailyTranslation = todayVerse['translation'];
    });
  }

  void _toggleRail() {
    setState(() {
      _isRailExtended = !_isRailExtended;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double railWidth = _isRailExtended ? 20 : 81; // Adjust the width as needed

    return Scaffold(
      appBar: AppBar(
        title: Text(translate('plural.home.home_page')),
        leading: IconButton(
          icon: Icon(_hideRail ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _hideRail = !_hideRail;
            });
          },
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: _hideRail ? 20 : railWidth,
            child: MyNavigationRail(hideRail: _hideRail),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: screenWidth - railWidth,
            padding: EdgeInsets.only(
                left: _isRailExtended ? 0 : 0), // Adjust the padding as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DailyVerseCard(
                  verse: dailyVerse,
                  translation: dailyTranslation,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    translate('azkar.azkar_elsabah'),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                AzkarElsabahCardWidget(
                  title: 'azkar el sabah',
                  iconData: Icons.alarm,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MorningAdhkarScreen(),
                      ),
                    );
                  },
                ),
                // ... other components
              ],
            ),
          ),
        ],
      ),
    );
  }
}
