import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klimatic/model/model.dart';

class Bottom extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;

  const Bottom({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel _obj = snapshot.data;
    
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 110,
              //width: MediaQuery.of(context).size.width/5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Wind",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  RichText(
                      text: TextSpan(
                    text: "${_obj.list[0].speed.toStringAsFixed(1)}",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    children: <TextSpan>[
                      TextSpan(
                        text: "\n  Km/h",
                        style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500)
                      )
                    ]
                  )),
                  Icon(FontAwesomeIcons.wind,color: Colors.white,size: 20,)
                ],
              ),
            ),
            Container(
              height: 110,
              //width: MediaQuery.of(context).size.width/5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Nigth",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  RichText(
                      text: TextSpan(
                    text: "${_obj.list[0].temp.night.toStringAsFixed(1)}",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    children: <TextSpan>[
                      TextSpan(
                        text: "\n  °C",
                        style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500)
                      )
                    ]
                  )),
                  Icon(FontAwesomeIcons.moon,color: Colors.white,size: 20,)
                ],
              ),
            ),
            Container(
              height: 110,
              //width: MediaQuery.of(context).size.width/5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Humidity",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  RichText(
                      text: TextSpan(
                    text: "${_obj.list[0].humidity.toStringAsFixed(1)}",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    children: <TextSpan>[
                      TextSpan(
                        text: "\n  %",
                        style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500)
                      )
                    ]
                  )),
                  Icon(FontAwesomeIcons.grinBeamSweat,color: Colors.white,size: 20,)
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
