import 'package:flutter/material.dart';
import 'quran_list.dart';
import 'package:quran/quran.dart' as quran;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_translate/flutter_translate.dart';

class DetailsPage extends StatefulWidget {
  final Surah surah;

  DetailsPage({required this.surah});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;
  String selectedReciter = "Sheikh Abdulbasit AbdulSamad"; // Default reciter

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.playing) {
        setState(() {
          isPlaying = true;
        });
      } else {
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  void playAudio(String audioUrl) {
    audioPlayer.play(UrlSource(audioUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surah.name),
      ),
      backgroundColor: Colors.teal,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/teal_1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // UI for selecting reciter
              DropdownButton<String>(
                value: selectedReciter,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedReciter = newValue!;
                  });
                },
                items: widget.surah.recitations
                    .map<DropdownMenuItem<String>>((reciter) {
                  return DropdownMenuItem<String>(
                    value: reciter.name,
                    // Wrap each DropdownMenuItem with SingleChildScrollView
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Text(reciter.name),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quran.basmala.isNotEmpty ? quran.basmala : '',
                  style: TextStyle(fontSize: 24, fontFamily: 'quranFont'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (isPlaying) {
                            audioPlayer.pause();
                          } else {
                            playAudio(widget.surah.recitations
                                .firstWhere((reciter) =>
                                    reciter.name == selectedReciter)
                                .audioUrl);
                          }
                        },
                        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                      ),
                      StreamBuilder<Duration>(
                        stream: audioPlayer.onPositionChanged,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return SizedBox();
                          return Text(
                            '${snapshot.data!.toString().split('.').first}',
                            style: TextStyle(color: Colors.white),
                          );
                        },
                      ),
                      StreamBuilder<Duration>(
                        stream: audioPlayer.onDurationChanged,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return SizedBox();
                          return Text(
                            '${snapshot.data!.toString().split('.').first}',
                            style: TextStyle(color: Colors.white),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: quran.getVerseCount(widget.surah.number),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          quran.getVerse(widget.surah.number, index + 1,
                              verseEndSymbol: true),
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
