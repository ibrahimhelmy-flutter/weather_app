import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/presentation/widgets/todayWatherDetails.dart';

class BuildCityCurrentWeather extends StatelessWidget {
  final WeatherModel model;
  const BuildCityCurrentWeather( {
    Key? key,
    required this.model
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 30, vertical: 5),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    model.city!.name!,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87),
                  ),
                  Text(
                      model.list!.first.weather!.first
                          .description!,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54)),
                ],
              ),
            ),
            TodayWeatherDetails(model),
          ],
        ),
      ),
    );
  }
}