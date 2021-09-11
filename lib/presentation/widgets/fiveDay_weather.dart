import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/presentation/widgets/build__houre_item.dart';
import 'package:weather_app/utils/component.dart';

class FiveDayWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = WeatherCubit.get(context);

    return Column(
      children: [
        buildDayRowThreeHour(cubit.dayOne),
        buildDayRowThreeHour(cubit.dayTwo),
        buildDayRowThreeHour(cubit.dayThree),
        buildDayRowThreeHour(cubit.dayFour),
        buildDayRowThreeHour(cubit.dayFive),
      ],
    );
  }

  Container buildDayRowThreeHour(List<dynamic> dayThree) {
    var date = DateTime.fromMillisecondsSinceEpoch((dayThree.first.dt)! * 1000);
    var textDay = DateFormat('EEE').format(date);
    return Container(
        height: 200,
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textDay,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Expanded(
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: dayThree
                      .map((dayThree) => weatherHourItem(
                          dayThree.main!.tempMin.ceil().toString(),
                          dayThree.main!.tempMax.ceil().toString(),
                          getWeatherIcon(dayThree.weather!.first.id!),
                          dayThree.dt))
                      .toList(),
                ),
              ),
            ),
          ],
        ));
  }
}


