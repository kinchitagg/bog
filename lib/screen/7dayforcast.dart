import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:klimatic/model/model.dart';
import 'package:klimatic/shared/utils.dart';

class MoreDetails extends StatefulWidget {
  final AsyncSnapshot<WeatherModel> snapshot;

  const MoreDetails({Key key, this.snapshot}) : super(key: key);
  @override
  _MoreDetailsState createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {
  int isTap;
  @override
  Widget build(BuildContext context) {
    WeatherModel _obj = widget.snapshot.data;
    //int isTap = _obj.list.length+1;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: getWeatherImage(
                    imageDescription: _obj.list[0].weather[0].main),
                fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  RichText(
                      text: TextSpan(
                          text: "${_obj.city.name},",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                          children: <TextSpan>[
                        TextSpan(
                            text: " ${_obj.city.country}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300)),
                      ])),
                  IconButton(
                      icon: Icon(
                        Icons.clear_all,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isTap = -1;
                        });
                      })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Next 7 days",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 30.0, right: 8.0, left: 8.0),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: ListView.separated(
                    separatorBuilder: (_, index) {
                      return isTap == index
                          ? Divider(color:Colors.white): getline(
                        color: Colors.indigo[50],
                        thickness: 2.0,
                      );
                    },
                    itemCount: _obj.list.length,
                    itemBuilder: (context, index) {
                      return isTap == index
                          ? detailedCard(index)
                          : datacard(index);
                    }),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget detailedCard(int index) {
    WeatherModel _obj = widget.snapshot.data;
    var formatteddatetime = Utils.getFormatteddatetimewithoutyear(
        new DateTime.fromMillisecondsSinceEpoch(_obj.list[0].dt * 1000));
    return Container(
      
      color: Colors.white38,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListTile(
              leading: getWeatherIcon(
                  iconDescription: _obj.list[index].weather[0].main,
                  color: Colors.black,
                  size: 20),
              title: Text(
                "$formatteddatetime",
                style: TextStyle(color: Colors.black, fontSize:12),
              ),
              trailing: RichText(
                  text: TextSpan(
                      text: "${_obj.list[index].temp.max.toStringAsFixed(1)}°",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                    TextSpan(
                        text:
                            "  ${_obj.list[index].temp.min.toStringAsFixed(1)}°",
                        style: TextStyle(color: Colors.black54))
                  ])),
            ),
          ),
          getline(
            color: Colors.indigo[100],
            thickness: 2.0,
          ),
          Container(
            height: 100,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 4,
              crossAxisCount: 2,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Pressure",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8
                          ),
                        ),
                        Text(
                          "${_obj.list[index].pressure.toStringAsFixed(1)}Pa",
                          style: TextStyle(color: Colors.black54,fontSize: 8),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Wind",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8
                          ),
                        ),
                        Text(
                          "${_obj.list[index].speed.toStringAsFixed(1)}km/h",
                          style: TextStyle(color: Colors.black54,fontSize: 8),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Humidity",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8
                          ),
                        ),
                        Text(
                          "${_obj.list[index].humidity.toStringAsFixed(1)}%",
                          style: TextStyle(color: Colors.black54,fontSize: 8),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Sunrise",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8
                          ),
                        ),
                        Text(
                          "${_obj.list[index].temp.morn.toStringAsFixed(1)}°",
                          style: TextStyle(color: Colors.black54,fontSize: 8),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget datacard(int index) {
    WeatherModel _obj = widget.snapshot.data;
    var formatteddatetime = Utils.getFormatteddatetimewithoutyear(
        new DateTime.fromMillisecondsSinceEpoch(_obj.list[0].dt * 1000));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        onTap: () {
          setState(() {
            isTap = index;
          });
        },
        leading: getWeatherIcon(
            iconDescription: _obj.list[index].weather[0].main,
            color: Colors.black,
            size: 20),
        title: Text(
          "$formatteddatetime",
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        trailing: RichText(
            text: TextSpan(
                text: "${_obj.list[index].temp.max.toStringAsFixed(1)}°",
                style: TextStyle(color: Colors.black, fontSize: 14),
                children: <TextSpan>[
              TextSpan(
                  text: "  ${_obj.list[index].temp.min.toStringAsFixed(1)}°",
                  style: TextStyle(color: Colors.black54))
            ])),
      ),
    );
  }
}
