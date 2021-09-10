import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/presentation/widgets/appbar.dart';
import 'package:weather_app/presentation/widgets/countrywather.dart';
import 'package:weather_app/presentation/widgets/fiveDay_weather.dart';
import 'package:weather_app/presentation/widgets/image.dart';
import 'package:weather_app/presentation/widgets/loading_screen.dart';
import 'package:weather_app/presentation/widgets/todayWatherDetails.dart';


class LocationScreen extends StatelessWidget {
  static const String id = "/LocationScreen";



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        if(state is WeatherSuccessState){
          WeatherCubit cubit= WeatherCubit.get(context);
          WeatherModel model= cubit.locationWeather;
          return Scaffold(
            appBar: CustomAppBar(title: "Location Screen",),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  BuildImage(),
                  CountryWeather(),
                  TodayWeatherDetails(model),
                  FiveDayWeather(),
                ],
              ),
            ),
          );
        }else{
          return LoadingScreen();
        }
      },
    );
  }


}

