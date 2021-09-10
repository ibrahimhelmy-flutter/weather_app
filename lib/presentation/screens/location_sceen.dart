import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/data/models/weather.dart';
import '../widgets/appbar.dart';
import '../widgets/countrywather.dart';
import '../widgets/fiveDay_weather.dart';
import '../widgets/image.dart';
import '../widgets/loading_screen.dart';
import '../widgets/no_internet_screen.dart';
import '../widgets/todayWatherDetails.dart';

class LocationScreen extends StatelessWidget {
  static const String id = "/LocationScreen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        WeatherCubit cubit = WeatherCubit.get(context);
        WeatherModel? model = cubit.locationWeather;

        if (model != null) {
          return Scaffold(
              appBar: CustomAppBar(title: "Location Screen"),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      BuildImage(
                          model: model,
                          imageSize: MediaQuery.of(context).size.width / 2.5),
                      CountryWeather(model: model),
                      TodayWeatherDetails(model),
                      FiveDayWeather(),
                    ],
                  )));
        } else if (state is WeatherLoadingState) {
          return LoadingScreen();
        } else {
          return NoInternetScreen();
        }
      },
    );
  }
}


