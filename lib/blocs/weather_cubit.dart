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
      emit(WeatherSuccessState());

    } catch (e) {
      emit(LocationDisableState());
      print(e);
    }

  }

  List<WeatherModel?>? listOfWeatherSearch = [];

  Future<void> getWeatherSearchData({required String cityNames}) async {
    listOfWeatherSearch = [];
    emit(WeatherSearchLoadingState());
    List<String> splitList = splitInputByComma(cityNames);
    List<Future<WeatherModel?>> listOfFutureWeather =
        splitList.map((name) => this._handleOneSearchCity(name)).toList();

    listOfFutureWeather
        .map((item) async =>
            await item != null ? listOfWeatherSearch!.add(await item) : null)
        .toList();
  }

  Future<WeatherModel?> _handleOneSearchCity(String cityName) async {
    WeatherModel? response =
        await WeatherService.fetchWeatherOnCity(cityName: cityName);
    emit(WeatherSearchSuccessState());
    return response;
  }


}
