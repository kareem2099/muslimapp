import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_translate/flutter_translate.dart';

class DoaaPage extends StatefulWidget {
  const DoaaPage({Key? key}) : super(key: key);

  @override
  _DoaaPageState createState() => _DoaaPageState();
}

class _DoaaPageState extends State<DoaaPage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  int currentPrayerIndex = 0;
  Duration duration = Duration();
  Duration position = Duration();
  bool isPlaying = false;

  final List<String> prayers = [
    'audio1.mp3',
    'assets/tra/audio2.mp3',
    'assets/tra/audio3.mp3',
    'assets/tra/audio4.mp3',
    'assets/tra/audio5.mp3',
    'assets/tra/audio6.mp3',
    'assets/tra/audio7.mp3',
    // Add more prayers here
  ];

  @override
  void initState() {
    super.initState();
    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });
    audioPlayer.getCurrentPosition().then((Duration? p) {
      if (p != null) {
        setState(() {
          position = p;
        });
      }
    });
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.stop();
    super.dispose();
  }

  void togglePlayback() {
    if (isPlaying) {
      audioPlayer.pause();
    } else {
      audioPlayer.play(AssetSource(prayers[currentPrayerIndex]));
    }
  }

  void playNextPrayer() {
    if (currentPrayerIndex < prayers.length - 1) {
      audioPlayer.play(AssetSource(prayers[currentPrayerIndex]));
      currentPrayerIndex++;
    } else {
      currentPrayerIndex = 0;
    }
  }

  void playPreviousPrayer() {
    if (currentPrayerIndex > 0) {
      currentPrayerIndex--;
      audioPlayer.play(AssetSource(prayers[currentPrayerIndex]));
    } else {
      currentPrayerIndex = prayers.length - 1;
      audioPlayer.play(AssetSource(prayers[currentPrayerIndex]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate('plural.doaa_page.title')),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: prayers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(translate('plural.doaa_page.doaa_${index + 1}')),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.music_note,
                      color: currentPrayerIndex == index ? Colors.blue : null,
                    ),
                    onPressed: () {
                      setState(() {
                        if (currentPrayerIndex != index) {
                          currentPrayerIndex = index;
                        }
                        audioPlayer
                            .play(AssetSource(prayers[currentPrayerIndex]));
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Text(
            '${position.inMinutes}:${position.inSeconds.remainder(60)} / ${duration.inMinutes}:${duration.inSeconds.remainder(60)}',
          ),
          Container(
            color: Colors.brown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  onPressed: currentPrayerIndex > 0
                      ? () {
                          setState(() {
                            playPreviousPrayer();
                          });
                        }
                      : null,
                ),
                IconButton(
                  icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                  onPressed: togglePlayback,
                ),
                IconButton(
                  icon: const Icon(Icons.stop),
                  onPressed: () {
                    audioPlayer.stop();
                    setState(() {
                      currentPrayerIndex = 0;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: currentPrayerIndex < prayers.length - 1
                      ? () {
                          setState(() {
                            playNextPrayer();
                          });
                        }
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
