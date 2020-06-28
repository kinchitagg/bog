import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Utils {
  static String appId = 'ed60fcfbd110ee65c7150605ea8aceea';

  static String getFormatteddatetime(DateTime dateTime) {
    return new DateFormat("EEEE , d MMM  y").format(dateTime);
  }

  static String getFormatteddatetimewithoutyear(DateTime dateTime) {
    return new DateFormat("EEEE , d MMM ").format(dateTime);
  }

  //
}

Widget getWeatherIcon({String iconDescription, Color color, double size}) {
  switch (iconDescription) {
    case 'Clear':
      {
        return Icon(FontAwesomeIcons.sun, color: color, size: size);
      }
      break;
    case 'Clouds':
      {
        return Icon(FontAwesomeIcons.cloud, color: color, size: size);
      }
      break;
    case 'Rain':
      {
        return Icon(FontAwesomeIcons.cloudRain, color: color, size: size);
      }
      break;
    case 'snow':
      {
        return Icon(FontAwesomeIcons.snowflake, color: color, size: size);
      }
      break;
    default:
      {
        return Icon(FontAwesomeIcons.sun, color: color, size: size);
      }
      break;
  }
}

AssetImage getWeatherImage({String imageDescription}) {
  switch (imageDescription) {
    case 'Clear':
      {
        return AssetImage("assets/clear.jpg");
      }
      break;
    case 'Clouds':
      {
        return AssetImage("assets/cloud.jpg");
      }
      break;
    case 'Rain':
      {
        return AssetImage("assets/rain.jpg");
      }
      break;
    case 'snow':
      {
        return AssetImage("assets/snow.jpg");
      }
      break;
    default:
      {
        return AssetImage("assets/clear.jpg");
      }
      break;
  }
}

Widget getline({Color color, double thickness}) {
  return Divider(
    color: color,
    thickness: thickness,
    indent: 20,
    endIndent: 20,
  );
}
