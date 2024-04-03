import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:adhan/adhan.dart';

class SalahList {
  static List<Map<String, String>> getPrayerTimes() {
    final egypt = Coordinates(
        30.888376, 32.378366); // Replace with your own location lat, lng.
    final nyUtcOffset = Duration(hours: 2);
    final nyDate = DateComponents.from(DateTime.now());
    final nyParams = CalculationMethod.egyptian.getParameters();
    nyParams.madhab = Madhab.hanafi;
    final nyPrayerTimes =
        PrayerTimes(egypt, nyDate, nyParams, utcOffset: nyUtcOffset);

    return [
      {
        "salah": "Al_Fajr",
        "salahTime": DateFormat('HH:mm:ss a').format(nyPrayerTimes.fajr)
      },
      {
        "salah": "Sunrise",
        "salahTime": DateFormat('HH:mm:ss a').format(nyPrayerTimes.sunrise)
      },
      {
        "salah": "Aduher",
        "salahTime": DateFormat('HH:mm:ss a').format(nyPrayerTimes.dhuhr)
      },
      {
        "salah": "Asr",
        "salahTime": DateFormat('HH:mm:ss a').format(nyPrayerTimes.asr)
      },
      {
        "salah": "Maghreb",
        "salahTime": DateFormat('HH:mm:ss a').format(nyPrayerTimes.maghrib)
      },
      {
        "salah": "Eshaa",
        "salahTime": DateFormat('HH:mm:ss a').format(nyPrayerTimes.isha)
      },
    ];
  }

  static Color getCurrentPrayerColor() {
    String currentSalah = getCurrentPrayer();
    if (currentSalah == "Al_Fajr" ||
        currentSalah == "Aduher" ||
        currentSalah == "Asr" ||
        currentSalah == "Maghreb" ||
        currentSalah == "Eshaa") {
      return Colors.orangeAccent; // Set blue color for the current Salah
    } else {
      return Colors.white; // Set default color for other times
    }
  }

  static String getCurrentTime() {
    var now = DateTime.now();
    return DateFormat('HH:mm:s a').format(now);
  }

  static String getCurrentPrayer() {
    final egypt = Coordinates(
        30.888376, 32.378366); // Replace with your own location lat, lng.
    final nyUtcOffset = Duration(hours: 2);
    final nyDate = DateComponents.from(DateTime.now());
    final nyParams = CalculationMethod.egyptian.getParameters();
    nyParams.madhab = Madhab.hanafi;
    final nyPrayerTimes =
        PrayerTimes(egypt, nyDate, nyParams, utcOffset: nyUtcOffset);

    DateTime now = DateTime.now();
    if (now.isBefore(nyPrayerTimes.fajr)) {
      return 'Al_Fajr';
    } else if (now.isBefore(nyPrayerTimes.sunrise)) {
      return 'Sunrise';
    } else if (now.isBefore(nyPrayerTimes.dhuhr)) {
      return 'Aduher';
    } else if (now.isBefore(nyPrayerTimes.asr)) {
      return 'Asr';
    } else if (now.isBefore(nyPrayerTimes.maghrib)) {
      return 'Maghreb';
    } else if (now.isBefore(nyPrayerTimes.isha)) {
      return 'Eshaa';
    } else {
      return ''; // Return empty string if no prayer time matches
    }
  }
}
