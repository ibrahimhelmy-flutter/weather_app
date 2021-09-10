import 'package:flutter/material.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/utils/component.dart';


class BuildImage extends StatelessWidget {
 final WeatherModel model;
 final double imageSize;
  BuildImage({required this.model,required this.imageSize});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        getWeatherIcon(model.list!.first.weather!.first.id!),
        style: TextStyle(fontSize: imageSize),
      ),
    );
  }
}
