import 'package:flutter/material.dart';
import 'package:klimatic/model/model.dart';
import 'package:klimatic/shared/utils.dart';

class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;

  const MidView({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel _obj = snapshot.data;
    var formatteddatetime = Utils.getFormatteddatetime(
        new DateTime.fromMillisecondsSinceEpoch(_obj.list[0].dt * 1000));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RichText(
                text: TextSpan(
                    text: "${_obj.city.name}",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                    children: <TextSpan>[
                  TextSpan(
                    text: "\n$formatteddatetime",
                    style: TextStyle(fontSize: 18),
                  )
                ])),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${_obj.list[0].temp.day.toStringAsFixed(1)}°",
                    style: TextStyle(color: Colors.white, fontSize: 65),
                  ),
                  Row(
                    children: <Widget>[
                      getWeatherIcon(
                          iconDescription: "${_obj.list[0].weather[0].main}",
                          color: Colors.white,
                          size: 20),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "${_obj.list[0].weather[0].description}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
