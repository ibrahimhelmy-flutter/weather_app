import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/network_services/weather_service.dart';
import 'package:weather_app/utils/component.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  static WeatherCubit get(context) => BlocProvider.of(context);

  WeatherModel? locationWeather;

  Future<void> getWeatherLocationData() async {
    emit(WeatherLoadingState());

    try {
      Position position = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high);
      locationWeather =
      await WeatherService.fetchWeatherOnLocation(position: position);
      getDailyList(locationWeather);
      emit(WeatherSuccessState());

    } catch (e) {
      emit(LocationDisableState());
      print(e);
    }

  }

  List<WeatherModel?> listOfWeatherSearch = [];

  Future<void> getWeatherSearchData({  cityNames}) async {
    listOfWeatherSearch = [];
    emit(WeatherSearchLoadingState());
    List<String> splitList = splitInputByComma(cityNames);
    List<Future<WeatherModel?>> listOfFutureWeather =
        splitList.map((name) => this._handleOneSearchCity(name)).toList();

    listOfFutureWeather
        .map((item) async =>
            await item != null ? listOfWeatherSearch.add(await item) : null)
        .toList();
  }

  Future<WeatherModel?> _handleOneSearchCity(String cityName) async {
    WeatherModel? response =
        await WeatherService.fetchWeatherOnCity(cityName: cityName);
    emit(WeatherSearchSuccessState());
    return response;
  }








  List<WeatherList> dayOne = [];
  List<WeatherList> dayTwo = [];
  List<WeatherList> dayThree = [];
  List<WeatherList> dayFour = [];
  List<WeatherList> dayFive = [];



  void getDailyList(
      WeatherModel? model,
     ) {
    model!.list!.map((el) {
      final now = DateTime.now();
      var date = DateTime.fromMillisecondsSinceEpoch((el.dt)! * 1000);
      if (date.day == now.day) {
        dayOne.add(el);
      } else if (date.day == now.add(Duration(days: 1)).day) {
        dayTwo.add(el);
      } else if (date.day == now.add(Duration(days: 2)).day) {
        dayThree.add(el);
      } else if (date.day == now.add(Duration(days: 3)).day) {
        dayFour.add(el);
      } else if (date.day == now.add(Duration(days: 4)).day) {
        dayFive.add(el);
      }
    }).toList();
  }

}
