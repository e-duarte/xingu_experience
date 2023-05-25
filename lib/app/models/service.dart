import 'package:xingu_experience/app/models/package.dart';

class Service {
  final String name;
  final String description;
  final List<String> photos;
  final List<Package> packages;
  final String cardTitle;
  final String cardDescription;
  final String coverPhoto;

  Service({
    required this.name,
    required this.description,
    required this.photos,
    required this.packages,
    required this.cardTitle,
    required this.cardDescription,
    required this.coverPhoto,
  });
}
