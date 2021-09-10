import 'package:flutter/material.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/data/models/weather.dart';


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
          Expanded(
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        model.list.first.wind.speed.toString(),
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'km/H',
                        style: TextStyle(
                          color: Colors.blue,

                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/sun2.png',
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    'Wind Speed',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 2,
            child: Container(
              color: Colors.blue.withOpacity(0.1),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        model.list.first.main.tempMin.ceil().toString()+"°",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),    SizedBox(width: 12,),    Text(
                        model.list.first.main.tempMax.ceil().toString()+"°",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    WeatherCubit.get(context).getWeatherIcon(model.list.first.weather.first.id),
                    style: TextStyle(fontSize:45),
                  ),
                  Text(
                    'Weather',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 2,
            child: Container(
              color: Colors.blue.withOpacity(0.1),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.list.first.main.humidity.toString()+"%",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Image.asset(
                    'assets/images/sun5.png',
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    'Humidity',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
