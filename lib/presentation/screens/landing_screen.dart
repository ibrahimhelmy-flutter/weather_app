import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import '../screens/location_sceen.dart';
import '../screens/searchScreen.dart';
import '../widgets/main_button.dart';

class LandingScreen extends StatelessWidget {
  static const String id = "/LandingScreen";

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildAppName(context),
            MaterialMainButton(
                onClick: () {
                  WeatherCubit.get(context).getWeatherLocationData();
                  Navigator.pushNamed(context, LocationScreen.id);
                },
                icon: Icons.my_location_outlined,
                iconSize: 30,
                message: "Location Weather",
                color: Colors.blueAccent,
                radius: 5,
                height: 60,
                width: width / 1.5),
            SizedBox(height: 50),
            MaterialMainButton(
                onClick: () => Navigator.pushNamed(context, SearchScreen.id),
                icon: Icons.search_outlined,
                iconSize: 30,
                message: "Search Weather",
                color: Colors.blueAccent,
                radius: 5,
                height: 60,
                width: width / 1.5),
          ],
        ),
      ),
    );
  }

  Container buildAppName(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 6,
        child: Align(
          alignment: Alignment.topCenter,
          child: Text("Weather App",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 50,
                  fontWeight: FontWeight.bold)),
        ));
  }
}
