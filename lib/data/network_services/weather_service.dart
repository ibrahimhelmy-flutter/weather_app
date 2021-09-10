import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/utils/component.dart';
import 'package:weather_app/utils/constants.dart';

class WeatherService {
  static Future<WeatherModel?> fetchWeatherOnCity(
      {required String cityName}) async {
    var uri = "${BaseUrl}q=$cityName&units=metric&appid=${apiKey}";
    return _fetchData(uri: uri);
  }

  static Future<WeatherModel?> fetchWeatherOnLocation(
      {required Position position}) async {
    var uri =
        "${BaseUrl}lat=${position.latitude}&lon=${position.longitude}&units=metric&appid=${apiKey}";
    return _fetchData(uri: uri);
  }

  static Future<WeatherModel?> _fetchData({required String uri}) async {
    try {
      final response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(response.body));
      } else {
        buildShowToast(
            color: Colors.red, msg: "${jsonDecode(response.body)['message']}");
      }
    } on TimeoutException catch (e) {
      buildShowToast(color: Colors.red, msg: "TimeoutException");
    } on SocketException catch (e) {
      buildShowToast(color: Colors.red, msg: "SocketException");
    } on Error catch (e) {
      buildShowToast(color: Colors.red, msg: "${e.toString()}");
    }
  }
}
