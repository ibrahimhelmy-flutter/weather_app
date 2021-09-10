import 'package:flutter/material.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/utils/component.dart';

class TodayWeatherDetails extends StatelessWidget {
  TodayWeatherDetails(this.model);

  final WeatherModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 130,
      margin: EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          buildExpanded(//    'km/H',
              context: context,
              header:model.list!.first.wind!.speed.toString()+' km/h',
              image: getWeatherIcon(900),
              name: 'Wind Speed'),
          virticalDivider(),
          buildExpanded(
              context: context,
              header: model.list!.first.main!.tempMin.ceil().toString() +
                  "°" +
                  "   " +
                  model.list!.first.main!.tempMax.ceil().toString() +
                  "°",
              image: getWeatherIcon(model.list!.first.weather!.first.id!),
              name: 'Weather'),
          virticalDivider(),
          buildExpanded(
              context: context,
              header:model.list!.first.main!.humidity.toString() + "%",
              image: getWeatherIcon(200),
              name: 'Humidity'),


        ],
      ),
    );
  }

  Expanded buildExpanded({context, header, image, name}) {
    return Expanded(
      flex: 4,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              header,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              image,
              style: TextStyle(fontSize: 45),
            ),
            Text(
              name,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class virticalDivider extends StatelessWidget {
  const virticalDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 2,
      child: Container(
        color: Colors.blue.withOpacity(0.1),
      ),
    );
  }
}
