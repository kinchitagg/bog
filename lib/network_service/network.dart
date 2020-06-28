import 'dart:convert';

import 'package:http/http.dart';
import 'package:klimatic/model/model.dart';
import 'package:klimatic/shared/utils.dart';


class Network {
  Future<WeatherModel> getweatherforcast({String cityName}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q="+cityName+"&appid="+Utils.appId+"&units=metric";

    final response = await get(Uri.encodeFull(finalUrl));
  print('Url ${Uri.encodeFull(finalUrl)} ');

  if (response.statusCode== 200){
    print('Weather data ${response.body}');
    return WeatherModel.fromJson(json.decode(response.body));
  }else{
    print('not fine');
    return null;
  }
  }
}