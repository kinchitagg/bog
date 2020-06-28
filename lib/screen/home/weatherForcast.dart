import 'package:flutter/material.dart';
import 'package:klimatic/Provider/cityProvider.dart';
import 'package:klimatic/model/model.dart';
import 'package:klimatic/network_service/network.dart';
import 'package:klimatic/screen/home/bottom.dart';
import 'package:klimatic/screen/home/search.dart';
import 'package:klimatic/shared/utils.dart';
import 'package:provider/provider.dart';

import 'midview.dart';

class WeatherForcast extends StatefulWidget {
  @override
  _WeatherForcastState createState() => _WeatherForcastState();
}

class _WeatherForcastState extends State<WeatherForcast> {
  Future<WeatherModel> forcastObject;
  String _cityName = 'new delhi';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    forcastObject = getweather(cityName: _cityName);
  }

  

  Future<WeatherModel> getweather({String cityName}) =>
      Network().getweatherforcast(cityName: cityName);
      
  @override
  Widget build(BuildContext context) {
    CityProvider cityProvider = Provider.of<CityProvider>(context);
    void cityChange(){
    setState(() {
      String city = cityProvider.city;
      forcastObject = getweather(cityName: city);

    });
  }
    return Scaffold(
      body: FutureBuilder<WeatherModel>(
          future: forcastObject,
          builder:
              (BuildContext context, AsyncSnapshot<WeatherModel> snapshot) {
            if (snapshot.hasData) {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: getWeatherImage(
                            imageDescription:
                                snapshot.data.list[0].weather[0].main),
                        fit: BoxFit.fill)),
                child: ListView(
                  children: <Widget>[
                    SearchBar(snapshot: snapshot,callback: cityChange,),
                    MidView(snapshot:snapshot),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:20.0),
                      child: getline(
                        color: Colors.white,
                        thickness: 0.8
                      ),
                    ),
                    Bottom(snapshot:snapshot),
                    ],
                ),
              );
            } else {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
    );
  }

  // 
}
