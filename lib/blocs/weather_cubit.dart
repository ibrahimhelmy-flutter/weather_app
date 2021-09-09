import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/network_services/weather_provider.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  static WeatherCubit get(context) => BlocProvider.of(context);

  WeatherModel locationWeather;

  Future<void> handleLocationData() async {
    emit(WeatherLoadingState());
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).catchError((e) {
      print(e.message);
    });


    WeatherModel weatherModel =
        await WeatherProvider.FetchRawWeatherResponseOnLocation(
      position: position,
    );
    locationWeather = weatherModel;
    emit(WeatherSuccessState());
    //return response;
  }

  List<Future<WeatherModel>> getWeatherData({String cityNames}) {
    emit(WeatherLoadingState());
    final splitNames = cityNames.split(',');
    List<String> splitList = [];
    for (int i = 0; i < splitNames.length; i++) {
      splitList.add(splitNames[i]);
    }

    return splitList.map((name) => this._handleSearchData(name)).toList();
  }

  Future<WeatherModel> _handleSearchData(String cityName) async {
    print("Hello5");
    WeatherModel response =
        await WeatherProvider.FetchRawWeatherResponseOnCity(cityName: cityName);
    return response;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }
}
