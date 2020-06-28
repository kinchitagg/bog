import 'package:flutter/material.dart';
import 'package:klimatic/Provider/cityProvider.dart';
import 'package:klimatic/screen/home/weatherForcast.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(new MaterialApp(
    title: 'Klimatic',
    home: ChangeNotifierProvider(
      create: (context)=> CityProvider(),
      child: WeatherForcast()),
  ));
}