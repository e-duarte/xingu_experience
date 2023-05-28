class Package {
  final int id;
  final String title;
  final String organizer;
  final String category;
  final String description;
  final int avaluation;
  final String duration;
  final String idiom;
  final bool cancel;
  final String location;
  final double price;
  final String coverPhoto;
  final List<String> photos;
  final int salesNumber;
  final int evaluationNumber;

  Package({
    required this.id,
    required this.title,
    required this.organizer,
    required this.category,
    required this.avaluation,
    required this.description,
    required this.duration,
    required this.idiom,
    required this.cancel,
    required this.location,
    required this.price,
    required this.coverPhoto,
    required this.photos,
    required this.salesNumber,
    required this.evaluationNumber,
  });
}
