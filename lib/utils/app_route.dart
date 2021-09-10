import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/screens/landing_screen.dart';
import 'package:weather_app/presentation/screens/location_sceen.dart';
import 'package:weather_app/presentation/screens/searchScreen.dart';

class AppRoute {
  static Route onGenerateRouting(RouteSettings settings) {
    switch (settings.name) {
      case LandingScreen.id:
        return MaterialPageRoute(builder: (context) => LandingScreen());

      case LocationScreen.id:
        return MaterialPageRoute(builder: (context) => LocationScreen());

      case SearchScreen.id:
        return MaterialPageRoute(builder: (context) => SearchScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: Text("unknown Route"),
                  ),
                ));
    }
  }
}
