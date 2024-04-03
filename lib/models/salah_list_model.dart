class SalahListTexts {
  final String salah;
  final String salahTime;

  SalahListTexts({
    required this.salah,
    required this.salahTime,
  });
}

List<SalahListTexts> salahListTexts = [
  SalahListTexts(salah: "Al_Fajr", salahTime: "4:66 "),
  SalahListTexts(salah: "Sunrise", salahTime: "5:38 "),
  SalahListTexts(salah: "Aduher", salahTime: "11:54 "),
  SalahListTexts(salah: "Asr", salahTime: "15:26 "),
  SalahListTexts(salah: "Maghreb", salahTime: "18:10 "),
  SalahListTexts(salah: "Eshaa", salahTime: "19:30 "),
];
