
class SalahListTexts {
  final String salah;
  final String salahTime;


  SalahListTexts(
      {required this.salah,
        required this.salahTime,
        });
}

List<SalahListTexts> salahListTexts = [
  SalahListTexts(salah: "Fajr", salahTime: "4:24 AM"),
  SalahListTexts(salah: "Sunrise", salahTime: "5:51 AM"),
  SalahListTexts(salah: "Dhuhr", salahTime: "12:01 PM"),
  SalahListTexts(salah: "Asr", salahTime: "3:30 PM"),
  SalahListTexts(salah: "Maghrib", salahTime: "6:10 PM"),
  SalahListTexts(salah: "Isha", salahTime: "7:28 PM"),

];

