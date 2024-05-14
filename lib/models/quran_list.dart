import 'package:flutter_translate/flutter_translate.dart';
import 'package:quran/quran.dart' as quran;
import 'dart:math';

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

// Function to get a random verse
Map<String, dynamic> getRandomVerse() {
  Random random = Random();
  int randomSurahIndex = random.nextInt(114); // Generate random Surah index
  int numberOfVerses = int.parse(allsurahsDetails[randomSurahIndex]
      .numberOfVerses); // Parse numberOfVerses as an integer
  int randomVerseIndex =
      random.nextInt(numberOfVerses) + 1; // Generate random verse index
  String verse = quran.getVerse(
      randomSurahIndex + 1, randomVerseIndex); // Get the verse text
  String translation = quran.getVerseTranslation(
      randomSurahIndex + 1, randomVerseIndex); // Get the verse translation text
  return {
    'surah': allsurahsDetails[randomSurahIndex].name,
    'verseNumber': randomVerseIndex,
    'verse': verse,
    'translation': translation,
  };
}

void main() {
  Map<String, dynamic> todayVerse = getRandomVerse();
  print(
      'Today\'s Verse: ${todayVerse['surah']} ${todayVerse['verseNumber']}: ${todayVerse['verse']}');
  print('Translation: ${todayVerse['translation']}');
}
