import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/utils/commponent.dart';

const apiKey = "e5ce4396a742a3620f294226a89898b4";

class WeatherProvider {
  //get weather base on geolocation
  //api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid={API key}

  //get weather base on city name
  //api.openweathermap.org/data/2.5/forecast?q={city name}&appid={API key}

  static Future<WeatherModel> FetchRawWeatherResponseOnCity(
      {String cityName}) async {
    final response = await http.get(
        "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&units=metric&appid=${apiKey}");

    if (response.statusCode == 200) {
      // print(">>>>>>>>>>>>>${response.body}");
        return  WeatherModel.fromJson(jsonDecode(response.body));
    }
    else {
      buildShowToast(color:Colors.red,msg: "${jsonDecode(response.body)['message']}");
      print("error  ${response.statusCode} ");
      print("error  ${jsonDecode(response.body)['message']} ");
    }

  }

  static Future<WeatherModel>  FetchRawWeatherResponseOnLocation(
      {Position position}) async {
    final response = await http.get(
        "https://api.openweathermap.org/data/2.5/forecast?lat=${position.latitude}&lon=${position.longitude}&units=metric&appid=${apiKey}");//&lang=ar
    if (response.statusCode == 200) {
      print(response.body);
      return  WeatherModel.fromJson(jsonDecode(response.body));
      print(response.body);
    } else {
      print("error  ${response.statusCode} ");
    }
  }
}
