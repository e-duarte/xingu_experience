class Package {
  final int id;
  final String title;
  final String organizer;
  final String category;
  final int avaluation;
  final double price;
  final String coverPhoto;
  final List<String> photos;

  Package({
    required this.id,
    required this.title,
    required this.organizer,
    required this.category,
    required this.avaluation,
    required this.price,
    required this.coverPhoto,
    required this.photos,
  });
}
