import 'package:flutter_translate/flutter_translate.dart';
import 'package:quran/quran.dart' as quran;

class Surah {
  final String name;
  final int number;
  final String numberOfVerses;
  final String revelationType;
  final String basmala;
  final List<Recitation> recitations; // Added recitations list

  Surah({
    required this.name,
    required this.number,
    required this.numberOfVerses,
    required this.revelationType,
    required this.basmala,
    required this.recitations,
  });
}

class Recitation {
  final String name;
  final String audioUrl;

  Recitation({required this.name, required this.audioUrl});
}

List<Surah> allsurahsDetails = List.generate(114, (index) {
  int surahNumber = index + 1;
  return Surah(
    name: translate('plural.surahs.name_$surahNumber'),
    number: surahNumber,
    numberOfVerses: translate('plural.surahs.verses_$surahNumber'),
    revelationType: translate('plural.surahs.revelationType_$surahNumber'),
    basmala: quran.basmala,
    recitations: [
      Recitation(
        name: "Sheikh Abdulbasit AbdulSamad",
        audioUrl:
            'https://server7.mp3quran.net/basit/Almusshaf-Al-Mojawwad/${surahNumber.toString().padLeft(3, '0')}.mp3',
      ),
      Recitation(
        name: "Sheikh Mishary Rashid Alafasy",
        audioUrl:
            'https://server7.mp3quran.net/afs/Alafasy/00${surahNumber}.mp3',
      ),
      Recitation(
        name: "Sheikh Fares Abbad",
        audioUrl:
            'https://server8.mp3quran.net/frs_a/${surahNumber.toString().padLeft(3, '0')}.mp3',
      ),
      Recitation(
        name: "Sheikh Maher Al Muaiqly",
        audioUrl:
            'https://server12.mp3quran.net/maher/${surahNumber.toString().padLeft(3, '0')}.mp3',
      ),
      Recitation(
        name: "Sheikh Abdulrahman Al Sudais",
        audioUrl:
            'https://server8.mp3quran.net/afs/${surahNumber.toString().padLeft(3, '0')}.mp3',
      ),
      Recitation(
        name: "Sheikh Muhammad Minshawi",
        audioUrl:
            'https://server10.mp3quran.net/minsh/${surahNumber.toString().padLeft(3, '0')}.mp3',
      ),
      Recitation(
        name: "Saad Al-Ghamdi",
        audioUrl:
            'https://server7.mp3quran.net/s_gmd/${surahNumber.toString().padLeft(3, '0')}.mp3',
      ),
    ],
  );
});
