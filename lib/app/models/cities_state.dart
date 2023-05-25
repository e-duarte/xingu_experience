import 'package:flutter/material.dart';
import 'package:xingu_experience/app/models/city.dart';

class CitiesState extends ChangeNotifier {
  List<City> _cities = [];
  City? _city;
  List<City> get cities => _cities;

  set cities(List<City> cities) {
    _cities = cities;
    _city = cities[1];
    notifyListeners();
  }

  City get city => _city!;

  void updateCity(City city) {
    _city = city;
    notifyListeners();
  }
}
