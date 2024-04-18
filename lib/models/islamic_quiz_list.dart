import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_translate/flutter_translate.dart';

class IslamicQuestion {
  String question;
  List<String> choices;
  int correctAnswerIndex;
  int score;
  int number;

  IslamicQuestion({
    required this.question,
    required this.choices,
    required this.correctAnswerIndex,
    required this.score,
    required this.number,
  });
}

List<IslamicQuestion> easyQuestions = [
  IslamicQuestion(
      question: "من كانت أول زوجة للنبي محمد (صلى الله عليه وسلم)؟",
      choices: ["عائشة", "سودة", "خديجة", "حفصة"],
      correctAnswerIndex: 2,
      score: 10,
      number: 1),
  IslamicQuestion(
      question: "ما معنى \"السنة\" في الإسلام؟",
      choices: [
        "الطريقة الحياتية المحددة كشرعية في الإسلام، استنادًا إلى تعاليم وممارسات النبي محمد وتفسيرات القرآن.",
        "القرآن",
        "نوع من الصلاة",
        "نداء الصلاة"
      ],
      correctAnswerIndex: 0,
      score: 10,
      number: 2),
  IslamicQuestion(
      question: "ما هو اسم الشهادة الإسلامية؟",
      choices: ["الصلاة", "الزكاة", "الحج", "الشهادة"],
      correctAnswerIndex: 3,
      score: 10,
      number: 3),
  IslamicQuestion(
      question:
          "ما اسم الرحلة الليلية للنبي محمد (صلى الله عليه وسلم) من مكة إلى القدس؟",
      choices: ["الهجرة", "الإسراء والمعراج", "الجمعة", "ليلة القدر"],
      correctAnswerIndex: 1,
      score: 10,
      number: 4),
  IslamicQuestion(
      question: "ما المصطلح الذي يطلق على إعطاء الصدقة في الإسلام؟",
      choices: ["الزكاة", "الصدقة", "الخمس", "الفطرة"],
      correctAnswerIndex: 0,
      score: 10,
      number: 5),
  IslamicQuestion(
      question: "أي ملاك مسؤول عن نقل الوحي إلى الأنبياء؟",
      choices: ["إسرافيل", "ميكائيل (ميخائيل)", "عزرائيل", "جبريل (غابرييل)"],
      correctAnswerIndex: 3,
      score: 10,
      number: 6),
  IslamicQuestion(
      question: "ما هو الكتاب المقدس في الإسلام؟",
      choices: ["الحديث", "التوراة", "القرآن", "الإنجيل"],
      correctAnswerIndex: 2,
      score: 10,
      number: 7),
  IslamicQuestion(
      question: "ما هو اسم شهر الصيام في الإسلام؟",
      choices: ["رمضان", "شوال", "ذو الحجة", "ربيع الأول"],
      correctAnswerIndex: 0,
      score: 10,
      number: 8),
  IslamicQuestion(
      question: "ما هو المصطلح المستخدم للحج إلى مكة خارج موسم الحج المحدد؟",
      choices: ["استسقاء", "عمرة", "الحج", "طواف"],
      correctAnswerIndex: 1,
      score: 10,
      number: 9),
  IslamicQuestion(
      question: "من يعتبر أول نبي في الإسلام؟",
      choices: ["موسى", "إبراهيم", "آدم", "نوح"],
      correctAnswerIndex: 3,
      score: 10,
      number: 10),
];

List<IslamicQuestion> mediumQuestions = [
  IslamicQuestion(
    question: 'What is the significance of the month of Ramadan in Islam?',
    choices: [
      'It is the month in which the Quran was revealed',
      'It marks the birth of Prophet Muhammad (peace be upon him)',
      'It commemorates the Battle of Badr',
      'It is the month of fasting and spiritual reflection'
    ],
    correctAnswerIndex:
        3, // It is the month of fasting and spiritual reflection
    score: 20,
    number: 1,
  ),
  IslamicQuestion(
    question: 'What is the name of the Islamic declaration of faith?',
    choices: ['Salat', 'Zakat', 'Hajj', 'Shahada'],
    correctAnswerIndex: 3, // Shahada
    score: 20,
    number: 2,
  ),
  IslamicQuestion(
    question: 'What does "Jihad" mean in Islam?',
    choices: [
      'Inner struggle or striving',
      'Holy war against non-believers',
      'Physical fighting',
      'Pilgrimage to Mecca'
    ],
    correctAnswerIndex: 0, // Inner struggle or striving
    score: 20,
    number: 3,
  ),
  IslamicQuestion(
    question:
        'What is the name of the night journey of Prophet Muhammad (peace be upon him) from Mecca to Jerusalem?',
    choices: ['Hijra', 'Jumu-ah', 'Laylat al-Qadr', 'Isra and Miraj'],
    correctAnswerIndex: 3, // Isra and Miraj
    score: 20,
    number: 4,
  ),
  IslamicQuestion(
    question:
        'What is the name of the pilgrimage to Mecca that Muslims perform at least once in their lifetime?',
    choices: ['Umrah', 'Istisqaa', 'Hajj', 'Tawaf'],
    correctAnswerIndex: 2, // Hajj
    score: 20,
    number: 5,
  ),
  IslamicQuestion(
    question: 'Which Prophet is known as the "Father of Prophets"?',
    choices: [
      'Prophet Adam (peace be upon him)',
      'Prophet Noah (peace be upon him)',
      'Prophet Abraham (peace be upon him)',
      'Prophet Muhammad (peace be upon him)'
    ],
    correctAnswerIndex: 2, // Prophet Abraham (peace be upon him)
    score: 20,
    number: 6,
  ),
  IslamicQuestion(
    question:
        'What is the name of the angel who brought revelations to Prophet Muhammad (peace be upon him)?',
    choices: ['Gabriel', 'Michael', 'Israfil', 'Azrael'],
    correctAnswerIndex: 0, // Gabriel
    score: 20,
    number: 7,
  ),
  IslamicQuestion(
    question: 'What is the name of the holy book of Islam?',
    choices: ['Injeel', 'Torah', 'Quran', 'Zabur'],
    correctAnswerIndex: 2, // Quran
    score: 20,
    number: 8,
  ),
  IslamicQuestion(
    question: 'What is the Arabic term for charity or almsgiving?',
    choices: ['Zakat', 'Sadaqah', 'Khums', 'Fitrah'],
    correctAnswerIndex: 0, // Zakat
    score: 20,
    number: 9,
  ),
  IslamicQuestion(
    question: 'In Islamic law, what is the punishment for theft?',
    choices: ['Flogging', 'Imprisonment', 'Fine', 'Cutting off the hand'],
    correctAnswerIndex: 3, // Cutting off the hand
    score: 20,
    number: 10,
  ),
  IslamicQuestion(
    question: 'What is the name of the Islamic month of fasting?',
    choices: ['Shawwal', 'Rajab', 'Dhu al-Hijjah', 'Ramadan'],
    correctAnswerIndex: 3, // Ramadan
    score: 20,
    number: 11,
  ),
  IslamicQuestion(
    question: 'Who is the last Prophet in Islam?',
    choices: [
      'Prophet Adam (peace be upon him)',
      'Prophet Moses (peace be upon him)',
      'Prophet Jesus (peace be upon him)',
      'Prophet Muhammad (peace be upon him)'
    ],
    correctAnswerIndex: 3, // Prophet Muhammad (peace be upon him)
    score: 20,
    number: 12,
  ),
  IslamicQuestion(
    question: 'What is the first month of the Islamic calendar?',
    choices: ['Muharram', 'Ramadan', 'Shawwal', 'Dhu al-Hijjah'],
    correctAnswerIndex: 0, // Muharram
    score: 20,
    number: 13,
  ),
  IslamicQuestion(
    question: 'What is the name of the angel of death in Islam?',
    choices: ['Azrael', 'Israfil', 'Gabriel', 'Michael'],
    correctAnswerIndex: 0, // Azrael
    score: 20,
    number: 14,
  ),
  IslamicQuestion(
    question: 'What is the name of the Islamic pilgrimage to Medina?',
    choices: ['Hijra', 'Jumu-ah', 'Umrah', 'Ziyarat'],
    correctAnswerIndex: 3, // Ziyarat
    score: 20,
    number: 15,
  ),
  IslamicQuestion(
    question: 'How many chapters (surahs) are there in the Quran?',
    choices: ['114', '100', '99', '120'],
    correctAnswerIndex: 0, // 114
    score: 20,
    number: 16,
  ),
  IslamicQuestion(
    question: 'What is the name of the Islamic month of pilgrimage?',
    choices: ['Rabi al-Awwal', 'Dhu al-Hijjah', 'Shawwal', 'Rajab'],
    correctAnswerIndex: 1, // Dhu al-Hijjah
    score: 20,
    number: 17,
  ),
  IslamicQuestion(
    question: 'Which city is considered the holiest in Islam?',
    choices: ['Mecca', 'Medina', 'Jerusalem', 'Cairo'],
    correctAnswerIndex: 0, // Mecca
    score: 20,
    number: 18,
  ),
  IslamicQuestion(
    question: 'What is the name of the Islamic month of fasting?',
    choices: ['Shawwal', 'Rajab', 'Dhu al-Hijjah', 'Ramadan'],
    correctAnswerIndex: 3, // Ramadan
    score: 20,
    number: 19,
  ),
  IslamicQuestion(
    question: 'What is the name of the Islamic declaration of faith?',
    choices: ['Salat', 'Zakat', 'Hajj', 'Shahada'],
    correctAnswerIndex: 3, // Shahada
    score: 20,
    number: 20,
  ),
];

List<IslamicQuestion> hardQuestions = [
  IslamicQuestion(
    question: 'What is the name of the Islamic declaration of faith?',
    choices: ['Shahada', 'Salat', 'Zakat', 'Hajj'],
    correctAnswerIndex: 0,
    score: 40,
    number: 1,
  ),
  IslamicQuestion(
    question:
        'What is the name of the night journey of Prophet Muhammad (peace be upon him) from Mecca to Jerusalem?',
    choices: ['Isra and Miraj', 'Hijra', 'Jumu-ah', 'Laylat al-Qadr'],
    correctAnswerIndex: 0,
    score: 40,
    number: 2,
  ),
  IslamicQuestion(
    question:
        'Which companion of the Prophet (peace be upon him) was known as the "Sword of Allah"?',
    choices: [
      'Abu Bakr',
      'Umar ibn al-Khattab',
      'Ali ibn Abi Talib',
      'Khalid ibn al-Walid'
    ],
    correctAnswerIndex: 3,
    score: 40,
    number: 3,
  ),
  IslamicQuestion(
    question:
        'What is the name of the wife of the Prophet Muhammad (peace be upon him) who was known as "Mother of the Believers"?',
    choices: ['Aisha', 'Khadijah', 'Sawda', 'Hafsa'],
    correctAnswerIndex: 1,
    score: 40,
    number: 4,
  ),
  IslamicQuestion(
    question:
        'What is the name of the city where the Prophet Muhammad (peace be upon him) was born?',
    choices: ['Mecca', 'Medina', 'Jerusalem', 'Taif'],
    correctAnswerIndex: 0,
    score: 40,
    number: 5,
  ),
  IslamicQuestion(
    question:
        'What is the name of the cave where the Prophet Muhammad (peace be upon him) received his first revelation?',
    choices: ['Hira', 'Thawr', 'Safa', 'Mina'],
    correctAnswerIndex: 0,
    score: 40,
    number: 6,
  ),
  IslamicQuestion(
    question:
        'In which battle did the Muslims suffer a setback, known as the Battle of Uhud?',
    choices: ['Badr', 'Khandaq', 'Uhud', 'Tabuk'],
    correctAnswerIndex: 2,
    score: 40,
    number: 7,
  ),
  IslamicQuestion(
    question:
        'What is the term for the pilgrimage made by Muslims to Mecca outside of the designated Hajj season?',
    choices: ['Umrah', 'Hajj al-Badal', 'Hajj', 'Ihram'],
    correctAnswerIndex: 0,
    score: 40,
    number: 8,
  ),
  IslamicQuestion(
    question:
        'What is the name of the well in Mecca near the Kaaba, which is associated with the story of Hagar and Ishmael?',
    choices: ['Zamzam', 'Safa', 'Marwah', 'Thawr'],
    correctAnswerIndex: 0,
    score: 40,
    number: 9,
  ),
  IslamicQuestion(
    question:
        'What is the term for the practice of giving a fixed portion of one’s wealth to charity, obligatory for Muslims?',
    choices: ['Zakat', 'Sadaqah', 'Fitra', 'Khums'],
    correctAnswerIndex: 0,
    score: 40,
    number: 10,
  ),
  IslamicQuestion(
    question:
        'What is the name of the angel who delivered revelations from Allah to the Prophet Muhammad (peace be upon him)?',
    choices: ['Jibril (Gabriel)', 'Israfil', 'Mikail (Michael)', 'Azrael'],
    correctAnswerIndex: 0,
    score: 40,
    number: 11,
  ),
  IslamicQuestion(
    question:
        'Which battle marked the end of paganism in Arabia and led to the conquest of Mecca by the Muslims?',
    choices: ['Badr', 'Khandaq', 'Uhud', 'Tabuk'],
    correctAnswerIndex: 3,
    score: 40,
    number: 12,
  ),
  IslamicQuestion(
    question:
        'What is the term for the night of the 27th of Ramadan, considered the Night of Decree in Islam?',
    choices: [
      'Laylat al-Baraat',
      'Laylat al-Qadr',
      'Laylat al-Mi’raj',
      'Laylat al-Isra'
    ],
    correctAnswerIndex: 1,
    score: 40,
    number: 13,
  ),
  IslamicQuestion(
    question:
        'Who was the first caliph (successor) of the Prophet Muhammad (peace be upon him)?',
    choices: ['Abu Bakr', 'Umar', 'Uthman', 'Ali'],
    correctAnswerIndex: 0,
    score: 40,
    number: 14,
  ),
  IslamicQuestion(
    question:
        'What is the term for the pilgrimage to Mecca that Muslims perform at least once in their lifetime?',
    choices: ['Hajj', 'Umrah', 'Istisqaa', 'Tawaf'],
    correctAnswerIndex: 0,
    score: 40,
    number: 15,
  ),
  IslamicQuestion(
    question: 'What is the name of the Islamic month of fasting?',
    choices: ['Ramadan', 'Shawwal', 'Muharram', 'Dhu al-Hijjah'],
    correctAnswerIndex: 0,
    score: 40,
    number: 16,
  ),
  IslamicQuestion(
    question:
        'What is the term for the struggle or striving in the way of Allah?',
    choices: ['Hijra', 'Hijab', 'Jihad', 'Halal'],
    correctAnswerIndex: 2,
    score: 40,
    number: 17,
  ),
  IslamicQuestion(
    question:
        'What is the name of the treaty that was signed between the Muslims of Medina and the tribes of Mecca?',
    choices: [
      'Treaty of Hudaybiyyah',
      'Treaty of Aqaba',
      'Treaty of Hudaibiya',
      'Treaty of Badr'
    ],
    correctAnswerIndex: 0,
    score: 40,
    number: 18,
  ),
  IslamicQuestion(
    question:
        'What is the term for the formal prayer observed by Muslims five times a day?',
    choices: ['Salat', 'Sawm', 'Zakat', 'Hajj'],
    correctAnswerIndex: 0,
    score: 40,
    number: 19,
  ),
  IslamicQuestion(
    question:
        'What is the name of the Islamic law derived from the Quran and the Hadith?',
    choices: ['Shariah', 'Sunni', 'Hadith', 'Fiqh'],
    correctAnswerIndex: 0,
    score: 40,
    number: 20,
  ),
  IslamicQuestion(
    question:
        'What is the term for the night journey of Prophet Muhammad (peace be upon him) from Mecca to Jerusalem?',
    choices: ['Isra and Miraj', 'Hijra', 'Jumu-ah', 'Laylat al-Qadr'],
    correctAnswerIndex: 0,
    score: 40,
    number: 21,
  ),
  IslamicQuestion(
    question:
        'Which companion of the Prophet (peace be upon him) was known as the "Sword of Allah"?',
    choices: [
      'Abu Bakr',
      'Umar ibn al-Khattab',
      'Ali ibn Abi Talib',
      'Khalid ibn al-Walid'
    ],
    correctAnswerIndex: 3,
    score: 40,
    number: 22,
  ),
  IslamicQuestion(
    question:
        'What is the name of the wife of the Prophet Muhammad (peace be upon him) who was known as "Mother of the Believers"?',
    choices: ['Aisha', 'Khadijah', 'Sawda', 'Hafsa'],
    correctAnswerIndex: 1,
    score: 40,
    number: 23,
  ),
  IslamicQuestion(
    question:
        'What is the name of the city where the Prophet Muhammad (peace be upon him) was born?',
    choices: ['Mecca', 'Medina', 'Jerusalem', 'Taif'],
    correctAnswerIndex: 0,
    score: 40,
    number: 24,
  ),
  IslamicQuestion(
    question:
        'What is the name of the cave where the Prophet Muhammad (peace be upon him) received his first revelation?',
    choices: ['Hira', 'Thawr', 'Safa', 'Mina'],
    correctAnswerIndex: 0,
    score: 40,
    number: 25,
  ),
  IslamicQuestion(
    question:
        'In which battle did the Muslims suffer a setback, known as the Battle of Uhud?',
    choices: ['Badr', 'Khandaq', 'Uhud', 'Tabuk'],
    correctAnswerIndex: 2,
    score: 40,
    number: 26,
  ),
  IslamicQuestion(
    question:
        'What is the term for the pilgrimage made by Muslims to Mecca outside of the designated Hajj season?',
    choices: ['Umrah', 'Hajj al-Badal', 'Hajj', 'Ihram'],
    correctAnswerIndex: 0,
    score: 40,
    number: 27,
  ),
  IslamicQuestion(
    question:
        'What is the name of the well in Mecca near the Kaaba, which is associated with the story of Hagar and Ishmael?',
    choices: ['Zamzam', 'Safa', 'Marwah', 'Thawr'],
    correctAnswerIndex: 0,
    score: 40,
    number: 28,
  ),
  IslamicQuestion(
    question:
        'What is the term for the practice of giving a fixed portion of one’s wealth to charity, obligatory for Muslims?',
    choices: ['Zakat', 'Sadaqah', 'Fitra', 'Khums'],
    correctAnswerIndex: 0,
    score: 40,
    number: 29,
  ),
  IslamicQuestion(
    question:
        'What is the name of the angel who delivered revelations from Allah to the Prophet Muhammad (peace be upon him)?',
    choices: ['Jibril (Gabriel)', 'Israfil', 'Mikail (Michael)', 'Azrael'],
    correctAnswerIndex: 0,
    score: 40,
    number: 30,
  ),
  IslamicQuestion(
    question:
        'Which battle marked the end of paganism in Arabia and led to the conquest of Mecca by the Muslims?',
    choices: ['Badr', 'Khandaq', 'Uhud', 'Tabuk'],
    correctAnswerIndex: 3,
    score: 40,
    number: 31,
  ),
  IslamicQuestion(
    question:
        'What is the term for the night of the 27th of Ramadan, considered the Night of Decree in Islam?',
    choices: [
      'Laylat al-Baraat',
      'Laylat al-Qadr',
      'Laylat al-Mi’raj',
      'Laylat al-Isra'
    ],
    correctAnswerIndex: 1,
    score: 40,
    number: 32,
  ),
  IslamicQuestion(
    question:
        'Who was the first caliph (successor) of the Prophet Muhammad (peace be upon him)?',
    choices: ['Abu Bakr', 'Umar', 'Uthman', 'Ali'],
    correctAnswerIndex: 0,
    score: 40,
    number: 33,
  ),
  IslamicQuestion(
    question:
        'What is the term for the pilgrimage to Mecca that Muslims perform at least once in their lifetime?',
    choices: ['Hajj', 'Umrah', 'Istisqaa', 'Tawaf'],
    correctAnswerIndex: 0,
    score: 40,
    number: 34,
  ),
  IslamicQuestion(
    question: 'What is the name of the Islamic month of fasting?',
    choices: ['Ramadan', 'Shawwal', 'Muharram', 'Dhu al-Hijjah'],
    correctAnswerIndex: 0,
    score: 40,
    number: 35,
  ),
  IslamicQuestion(
    question:
        'What is the term for the struggle or striving in the way of Allah?',
    choices: ['Hijra', 'Hijab', 'Jihad', 'Halal'],
    correctAnswerIndex: 2,
    score: 40,
    number: 36,
  ),
  IslamicQuestion(
    question:
        'What is the name of the treaty that was signed between the Muslims of Medina and the tribes of Mecca?',
    choices: [
      'Treaty of Hudaybiyyah',
      'Treaty of Aqaba',
      'Treaty of Hudaibiya',
      'Treaty of Badr'
    ],
    correctAnswerIndex: 0,
    score: 40,
    number: 37,
  ),
  IslamicQuestion(
    question:
        'What is the term for the formal prayer observed by Muslims five times a day?',
    choices: ['Salat', 'Sawm', 'Zakat', 'Hajj'],
    correctAnswerIndex: 0,
    score: 40,
    number: 38,
  ),
  IslamicQuestion(
    question:
        'What is the name of the Islamic law derived from the Quran and the Hadith?',
    choices: ['Shariah', 'Sunni', 'Hadith', 'Fiqh'],
    correctAnswerIndex: 0,
    score: 40,
    number: 39,
  ),
  IslamicQuestion(
    question:
        'In Islam, what is the term for the direction of the Kaaba in Mecca that Muslims face while praying?',
    choices: ['Qiblah', 'Mihrab', 'Sujood', 'Tawaf'],
    correctAnswerIndex: 0,
    score: 40,
    number: 40,
  ),
  // Add more questions here
];
