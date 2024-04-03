import 'package:flutter/material.dart';
import 'package:muslimapp/models/salah_list.dart';
import 'dart:async';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class SalahWidget extends StatefulWidget {
  const SalahWidget({Key? key}) : super(key: key);

  @override
  _SalahWidgetState createState() => _SalahWidgetState();
}

class _SalahWidgetState extends State<SalahWidget> {
  late Timer _timer;
  String? currentPrayer;
  String? currentTime;
  String? timeToNextSalah;
  String locale = 'ar';
  late HijriCalendar _today; // Declare _today variable
  late HijriCalendar hDate; // Declare hDate variable

  @override
  void initState() {
    super.initState();
    hijri();
    updatePrayerTime();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updatePrayerTime();
    });
  }

  void updatePrayerTime() {
    final nyPrayerTimes = SalahList.getPrayerTimes();
    final currentTime = DateFormat('HH:mm:ss a').format(DateTime.now());

    // Find the index of the next Salah time
    final nextSalahIndex = nyPrayerTimes.indexWhere(
      (salah) => currentTime.compareTo(salah['salahTime']!) < 0,
    );

    // If nextSalahIndex is -1, it means the current time is after the last Salah time of the day
    String nextSalahTime = '';
    if (nextSalahIndex != -1) {
      nextSalahTime = nyPrayerTimes[nextSalahIndex]['salahTime']!;
    } else {
      // If the current time is after the last Salah time, set nextSalahTime to the first Salah time of the next day
      nextSalahTime = nyPrayerTimes[0]['salahTime']!;
    }

    // Handle the case when the current time is before Fajr Salah time
    if (nextSalahIndex == -1) {
      nextSalahTime = nyPrayerTimes[0]['salahTime']!;
    }

    setState(() {
      currentPrayer = SalahList.getCurrentPrayer();
      this.currentTime = currentTime;
      timeToNextSalah = calculateTimeToNextSalah(currentTime, nextSalahTime);
    });
  }

  String calculateTimeToNextSalah(String currentTime, String nextSalahTime) {
    final currentTimeParsed = DateFormat('HH:mm:ss a').parse(currentTime);
    final nextSalahTimeParsed = DateFormat('HH:mm:ss a').parse(nextSalahTime);

    // If next Salah time is before the current time, it means it's on the next day
    if (nextSalahTimeParsed.isBefore(currentTimeParsed)) {
      final nextDay = DateTime.now().add(Duration(days: 1));
      final nextSalahTimeNextDay =
          DateFormat('yyyy-MM-dd').format(nextDay) + ' ' + nextSalahTime;
      final nextSalahTimeParsedNextDay =
          DateFormat('yyyy-MM-dd HH:mm:ss a').parse(nextSalahTimeNextDay);
      final difference =
          nextSalahTimeParsedNextDay.difference(currentTimeParsed).inSeconds;

      final totalSeconds = difference >= 0
          ? difference
          : difference + 86400; // 86400 seconds in a day

      final hours = totalSeconds ~/ 3600;
      final minutes = (totalSeconds % 3600) ~/ 60;
      final seconds = totalSeconds % 60;

      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      final difference =
          nextSalahTimeParsed.difference(currentTimeParsed).inSeconds;

      final totalSeconds = difference >= 0
          ? difference
          : difference + 86400; // 86400 seconds in a day

      final hours = totalSeconds ~/ 3600;
      final minutes = (totalSeconds % 3600) ~/ 60;
      final seconds = totalSeconds % 60;

      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
  }

  Color _getCurrentPrayerColor() {
    return SalahList.getCurrentPrayerColor();
  }

  void hijri() {
    String locale = 'ar';

    _today = HijriCalendar.now(); // Initialize _today
    HijriCalendar.setLocal(locale);

    hDate = HijriCalendar.fromDate(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salah'),
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Text(
            currentTime ?? 'Loading...',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Hijri Date: ${_today.toFormat("MMMM dd yyyy")}', // Display Hijri date
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Current Salah: ${currentPrayer ?? 'Loading...'}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: _getCurrentPrayerColor(),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: SalahList.getPrayerTimes().length,
              itemBuilder: (context, index) {
                final salah = SalahList.getPrayerTimes()[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    color: Colors.teal, // Background color for the box
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                    border: Border.all(color: Colors.grey), // Border
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        salah['salah']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: salah['salah'] == currentPrayer
                              ? _getCurrentPrayerColor()
                              : Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        salah['salahTime']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: salah['salah'] == currentPrayer
                              ? _getCurrentPrayerColor()
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.teal, // Background color for the box
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
              border: Border.all(color: Colors.grey), // Border
            ),
            child: Text(
              'Time to next Salah is:\n$timeToNextSalah',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 70),
          Text(
            'Hijri Month Length: ${hDate.lengthOfMonth}', // Display Hijri month length
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
