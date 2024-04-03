class HorizontalList {
  final String image;
  final String text;

  HorizontalList({
    required this.image,
    required this.text,
  });
}

List<HorizontalList> horizontalList = [
  HorizontalList(image: 'assets/adeia.jpg', text: 'أدعية'),
  HorizontalList(image: 'assets/sebha.jpg', text: 'سبحة'),
  HorizontalList(image: 'assets/allahNames.gif', text: 'أسماء الله الحسنى'),
];
