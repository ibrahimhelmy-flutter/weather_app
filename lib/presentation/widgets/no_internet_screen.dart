import 'package:flutter/material.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/presentation/screens/landing_screen.dart';
import 'package:weather_app/presentation/screens/location_sceen.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton.icon(
                onPressed:() {
                  WeatherCubit.get(context).getWeatherLocationData();
                  Navigator.pushReplacementNamed(context, LocationScreen.id);
                },
                icon: Icon(Icons.wifi),
                label: Text("Try Again")),
            Text("Please Check Internet And GPS"),
          ],
        ),
      ),
    );
  }
}