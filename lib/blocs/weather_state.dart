part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}
class WeatherSuccessState extends WeatherState {}
class WeatherErrorState extends WeatherState {}


class WeatherSearchLoadingState extends WeatherState {}
class WeatherSearchSuccessState extends WeatherState {}
class WeatherSearchErrorState extends WeatherState {}