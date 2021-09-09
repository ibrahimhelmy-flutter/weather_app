import 'package:flutter/material.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/data/models/weather.dart';


class BuildImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit= WeatherCubit.get(context);
    WeatherModel model= cubit.locationWeather;
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        cubit.getWeatherIcon(model.list.first.weather.first.id),
        style: TextStyle(fontSize: MediaQuery.of(context).size.width/2.5),
      ),
    );
  }
}
