import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/presentation/widgets/appbar.dart';
import 'package:weather_app/presentation/widgets/todayWatherDetails.dart';
import 'package:weather_app/utils/commponent.dart';

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
          appBar:CustomAppBar(title: "Search Screen"),
          // extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Form(
                  key: _form,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 20, 15, 5),
                    child: TextFormField(
                      controller: search,
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                      textInputAction: TextInputAction.go,
                      validator: (v) => validateSearchField(v),
                      onFieldSubmitted: (_) {
    if (_form.currentState.validate()) {WeatherCubit.get(context)
        .getWeatherData(cityNames: search.text);}

                      },
                      decoration: InputDecoration(
                        // labelText: 'Search city...',
                        // errorText: validatePassword(search.text),

                        filled: true,
                        fillColor: Color.fromRGBO(205, 212, 228, 0.2),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(50)),
                        contentPadding: EdgeInsets.all(10),
                        suffixIcon: IconButton(
                          onPressed: () async {
                            if (_form.currentState.validate()) {
                              WeatherCubit.get(context)
                                  .getWeatherData(cityNames: search.text);
                            }
                          },
                          icon: Icon(Icons.search),
                          iconSize: 30,
                          color: Colors.black87,
                        ),
                        hintText: "Search city...",
                        hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.black54),
                      ),
                    ),
                  ),
                ),
                if (cubit.listOfWeatherSearch.isEmpty)
                  Text(
                    "No Country In List",
                    style: TextStyle(color: Colors.black87),
                  ),
                if (state is WeatherSearchLoadingState)
                  CircularProgressIndicator(),
                ...cubit.listOfWeatherSearch
                    .map((e) => Card(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e.city.name,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black87),
                                    ),
                                    Text(e.list.first.weather.first.description,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54)),
                                  ],
                                ),
                              ),
                              TodayWeatherDetails(e),
                            ],
                          ),
                        ))
                    .toList()
              ],
            ),
          ),
        );
      },
    );
  }
}
