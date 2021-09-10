import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/presentation/screens/landing_screen.dart';
import 'package:weather_app/utils/app_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: MaterialApp(
        onGenerateRoute: AppRoute.onGenerateRouting,
        initialRoute: LandingScreen.id,
      ),
    );
  }
}
