import 'package:flutter/material.dart';
import 'package:weather_app/presentation/screens/location_sceen.dart';
import 'package:weather_app/presentation/screens/searchScreen.dart';
import 'package:weather_app/presentation/widgets/appbar.dart';
import 'package:weather_app/presentation/widgets/matrix_button.dart';

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
            MaterialButtonX(
              onClick: () => Navigator.pushNamed(context, LocationScreen.id),
              icon: Icons.my_location_outlined,
              iconSize: 30,
              message: "Location Weather",
              color: Colors.blueAccent,
              radius: 5,
              height: 60,
              width: width / 1.5,
            ),
            SizedBox(height: 40),
            MaterialButtonX(
              onClick: () => Navigator.pushNamed(context, SearchScreen.id),
              icon: Icons.search_outlined,
              iconSize: 30,
              message: "Search Weather",
              color: Colors.blueAccent,
              radius: 5,
              height: 60,
              width: width / 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
