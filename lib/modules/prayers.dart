import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
  bool isPlaying = false; // Track the playback state

  final List<String> prayers = [
    'audio1.mp3',
    'audio2.mp3',
    'audio3.mp3',
    'audio4.mp3',
    'audio5.mp3',
    'audio6.mp3',
    'audio7.mp3',
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
      // Update the playback state when it changes
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
    // Toggle between play and pause
    if (isPlaying) {
      audioPlayer.pause();
    } else {
      audioPlayer.play(AssetSource(prayers[currentPrayerIndex]));
    }
  }

  void playNextPrayer() {
    if (currentPrayerIndex < prayers.length - 1) {
      audioPlayer.play(AssetSource(prayers[currentPrayerIndex]));
      // Increment the index after playing the audio
      currentPrayerIndex++;
    } else {
      // Reset to the first prayer if the end of the list is reached
      currentPrayerIndex = 0;
    }
  }

  void playPreviousPrayer() {
    if (currentPrayerIndex > 0) {
      currentPrayerIndex--; // Decrement index to go to previous prayer
      audioPlayer.play(AssetSource(prayers[currentPrayerIndex]));
    } else {
      // If already at the beginning, play the last prayer
      currentPrayerIndex = prayers.length - 1;
      audioPlayer.play(AssetSource(prayers[currentPrayerIndex]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayers'),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: prayers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Prayer ${index + 1}'),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.music_note,
                      color: currentPrayerIndex == index ? Colors.blue : null,
                    ),
                    onPressed: () {
                      // Set the current prayer index and play the prayer
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
              '${position.inMinutes}:${position.inSeconds.remainder(60)} / ${duration.inMinutes}:${duration.inSeconds.remainder(60)}'),
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
                      : null, // Disable if no previous prayer
                ),
                IconButton(
                  icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                  onPressed: togglePlayback, // Toggle between play and pause
                ),
                IconButton(
                  icon: const Icon(Icons.stop),
                  onPressed: () {
                    audioPlayer.stop();
                    // Reset the prayer index when stopped
                    setState(() {
                      currentPrayerIndex = 0;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: currentPrayerIndex < prayers.length - 1
                      ? () {
                          // Play the next prayer
                          setState(() {
                            playNextPrayer();
                          });
                        }
                      : null, // Disable if no next prayer
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
