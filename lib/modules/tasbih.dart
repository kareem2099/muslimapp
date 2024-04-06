import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_translate/flutter_translate.dart';

class Tasbih extends StatefulWidget {
  final List<String> tasbeh;
  const Tasbih({Key? key, required this.tasbeh}) : super(key: key);

  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  int tasbehCount = 0; // Count for tasbeh
  int normalCount = 1; // Count for normal count up to 32
  int round = 0;
  Color _buttonColor = Colors.white; // Initial color for the button

  void incrementTasbehCount() {
    setState(() {
      tasbehCount++;
      if (tasbehCount == widget.tasbeh.length) {
        tasbehCount = 0;
        round++;
      }
    });
  }

  void incrementNormalCount() {
    setState(() {
      normalCount++;
      round = normalCount ~/
          32; // Calculate the round based on the division of normalCount by 32
      normalCount %= 32; // Reset normalCount to 0 when it reaches 32
    });
  }

  void resetCounts() {
    setState(() {
      tasbehCount = 0; // Reset tasbeh count to 0
      normalCount = 0; // Reset normal count to 0
      round = 0; // Reset the round to zero
    });
  }

  void changeColor() {
    setState(() {
      _buttonColor = _randomColor(); // Change the color of the button
      normalCount++; // Increment normal count
      if (normalCount == 32) {
        round++; // Increment round when normalCount reaches 32
        normalCount = 0; // Reset normalCount to 0
      }
    });
  }

  Color _randomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate('plural.tasbih_page.appBarTitle')),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (tasbehCount > 0) {
                            tasbehCount--;
                          } else {
                            tasbehCount = widget.tasbeh.length - 1;
                          }
                        });
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.tasbeh[tasbehCount],
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (tasbehCount < widget.tasbeh.length - 1) {
                            tasbehCount++;
                          } else {
                            tasbehCount = 0;
                          }
                        });
                      },
                      child: const Icon(
                        Icons.navigate_next_outlined,
                        size: 45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(
              "${translate('plural.tasbih_page.tasbehCount')}: ${tasbehCount + 1}/${widget.tasbeh.length}"),
          Text(
              "${translate('plural.tasbih_page.normalCount')}: $normalCount/32"),
          Text("${translate('plural.tasbih_page.round')} $round"),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: resetCounts,
                child: Text(translate('plural.tasbih_page.resetButton')),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff9e672f),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ClipOval(
            child: InkWell(
              onTap: changeColor,
              child: CircleAvatar(
                radius: 100,
                backgroundColor:
                    _buttonColor, // Use the variable to set the color
                child: Text(
                  translate('plural.tasbih_page.tasbeh'),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
