import 'package:flutter/material.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import '../screens/location_sceen.dart';
import '../screens/searchScreen.dart';
import '../widgets/matrix_button.dart';

class LandingScreen extends StatelessWidget {
  static const String id = "/LandingScreen";

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Weather App", style: TextStyle(color: Colors.blue)),
          centerTitle: true,automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButtonX(
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
            MaterialButtonX(
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
}
