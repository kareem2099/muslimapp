import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:adhan/adhan.dart';
import 'package:flutter_translate/flutter_translate.dart';

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
        "salah": translate('plural.salah_list.Al_Fajr'),
        "salahTime": DateFormat('HH:mm:ss a').format(nyPrayerTimes.fajr)
      },
      {
        "salah": translate('plural.salah_list.Sunrise'),
        "salahTime": DateFormat('HH:mm:ss a').format(nyPrayerTimes.sunrise)
      },
      {
        "salah": translate('plural.salah_list.Aduher'),
        "salahTime": DateFormat('HH:mm:ss a').format(nyPrayerTimes.dhuhr)
      },
      {
        "salah": translate('plural.salah_list.Asr'),
        "salahTime": DateFormat('HH:mm:ss a').format(nyPrayerTimes.asr)
      },
      {
        "salah": translate('plural.salah_list.Maghreb'),
        "salahTime": DateFormat('HH:mm:ss a').format(nyPrayerTimes.maghrib)
      },
      {
        "salah": translate('plural.salah_list.Eshaa'),
        "salahTime": DateFormat('HH:mm:ss a').format(nyPrayerTimes.isha)
      },
    ];
  }

  static Color getCurrentPrayerColor() {
    String currentSalah = getCurrentPrayer();
    if (currentSalah == translate('plural.salah_list.Al_Fajr') ||
        currentSalah == translate('plural.salah_list.Aduher') ||
        currentSalah == translate('plural.salah_list.Asr') ||
        currentSalah == translate('plural.salah_list.Maghreb') ||
        currentSalah == translate('plural.salah_list.Eshaa')) {
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
      return translate('plural.salah_list.Al_Fajr');
    } else if (now.isBefore(nyPrayerTimes.sunrise)) {
      return translate('plural.salah_list.Sunrise');
    } else if (now.isBefore(nyPrayerTimes.dhuhr)) {
      return translate('plural.salah_list.Aduher');
    } else if (now.isBefore(nyPrayerTimes.asr)) {
      return translate('plural.salah_list.Asr');
    } else if (now.isBefore(nyPrayerTimes.maghrib)) {
      return translate('plural.salah_list.Maghreb');
    } else if (now.isBefore(nyPrayerTimes.isha)) {
      return translate('plural.salah_list.Eshaa');
    } else {
      return ''; // Return empty string if no prayer time matches
    }
  }
}
