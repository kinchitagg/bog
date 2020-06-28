import 'package:flutter/material.dart';

class CityProvider with ChangeNotifier{
  String city;

  void cityUpdate(String cityName){
    city = cityName;
    notifyListeners();
    }
}