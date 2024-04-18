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
    'audios/doaa_1.mp3',
    'audios/doaa_2.mp3',
    'audios/doaa_3.mp3',
    'audios/doaa_4.mp3',
    'audios/doaa_5.mp3',
    'audios/doaa_6.mp3',
    'audios/doaa_7.mp3',
    // Add more prayers here
  ];

  final List<double> playbackRates = [0.5, 1.0, 1.5, 2.0]; // Playback rates

  int currentPlaybackRateIndex = 1; // Initial playback rate index

  @override
  void initState() {
    super.initState();
    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });

    audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
      });
    });

    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
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

  Future<void> togglePlayback() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer
          .setPlaybackRate(playbackRates[currentPlaybackRateIndex]);
      await audioPlayer.play(AssetSource(prayers[currentPrayerIndex]));
    }
  }

  Future<void> changePlaybackRate(int index) async {
    currentPlaybackRateIndex = index;
    if (isPlaying) {
      await audioPlayer
          .setPlaybackRate(playbackRates[currentPlaybackRateIndex]);
    }
  }

  String getPlaybackRateText() {
    return '${playbackRates[currentPlaybackRateIndex]}x'; // Get the current playback rate text
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
            '${(position.inMinutes).toString().padLeft(2, '0')}:${(position.inSeconds.remainder(60)).toString().padLeft(2, '0')} / ${(duration.inMinutes).toString().padLeft(2, '0')}:${(duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}',
          ),
          Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (value) {
              setState(() {
                audioPlayer.seek(Duration(seconds: value.toInt()));
              });
            },
          ),
          ListTile(
            title: const Text('Playback Speed'),
            trailing: PopupMenuButton<int>(
              icon: const Icon(Icons.speed),
              itemBuilder: (context) => List.generate(
                playbackRates.length,
                (index) => PopupMenuItem<int>(
                  value: index,
                  child: Text('${playbackRates[index]}x'),
                ),
              ),
              onSelected: (index) {
                setState(() {
                  changePlaybackRate(index);
                });
              },
            ),
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
                  icon: isPlaying
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow),
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
