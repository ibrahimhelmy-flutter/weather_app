import 'package:flutter/material.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/data/models/weather.dart';


class CountryWeather extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   WeatherModel model= WeatherCubit.get(context).locationWeather;
    return Container(
      margin: EdgeInsets.only(
        top: 5,
        bottom: 8,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.list.first.main.temp.ceil().toString(),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'C',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Text(
            model.city.name,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 17,
            ),
          ),
          Text(
          model.list.first.weather.first.description,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
