import 'package:xingu_experience/app/models/service.dart';

class City {
  final String city;
  final String state;
  final String descripition;
  final String coverPhoto;
  final List<String> photos;
  final List<Service> services;

  City({
    required this.city,
    required this.state,
    required this.descripition,
    required this.coverPhoto,
    required this.photos,
    required this.services,
  });

  // factory City.fromMap(Map<String, dynamic> data){

  // }
}
