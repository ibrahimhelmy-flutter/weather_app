import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_cubit.dart';

import '../widgets/appbar.dart';
import '../widgets/build_city_currentWeather.dart';

import '../widgets/search_formField.dart';


class SearchScreen extends StatelessWidget {
  static const String id = "/SearchScreen";

  final _form = GlobalKey<FormState>();
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {},
      builder: (context, state) {
        WeatherCubit cubit = WeatherCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(title: "Search Screen"),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SearchField(form: _form, search: search),
                if (cubit.listOfWeatherSearch!.isEmpty)
                  Text(
                    "No Country In List",
                    style: TextStyle(color: Colors.black87),
                  ),
                if (state is WeatherSearchLoadingState)
                  CircularProgressIndicator(),
                ...cubit.listOfWeatherSearch!
                    .map((e) => BuildCityCurrentWeather(model:e!))
                    .toList()
              ],
            ),
          ),
        );
      },
    );
  }
}


