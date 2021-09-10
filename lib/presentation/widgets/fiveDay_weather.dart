import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/blocs/weather_cubit.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/utils/component.dart';

class FiveDayWeather extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit= WeatherCubit.get(context);
    WeatherModel? model= cubit.locationWeather;
    return Container(
      height: 220,
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: model!.list!.length,
            itemBuilder: (c, i) {
              return forecastElement( model.list![i].main!.tempMin.ceil().toString(),model.list![i].main!.tempMax.ceil().toString(),getWeatherIcon(model.list![i].weather!.first.id!),model.list![i].dt);
            })


        );
  }
}


var oldDay;
bool isNewDay=true;
Widget forecastElement(
      minTemperature, maxTemperature, weatherIcon,dt) {
var textDay;

final now = DateTime.now();
 var date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);

 if(oldDay !=null && oldDay!=date.day){
   oldDay=date.day;
   isNewDay=!isNewDay;
   // return Container(color: Colors.red,width: 10,);
 }else{
   oldDay=date.day;

 }

var hour=DateFormat("h a").format(date);
var  formattedDate = DateFormat('EEE').format(date);

  if(formattedDate == DateFormat('EEE').format(now)) {
    textDay = "Today";
  }
  else if(formattedDate == DateFormat('EEE').format(DateTime(now.year, now.month, now.day + 1))) {
    textDay = "Tomorrow";
  }
  else {
    textDay = DateFormat('EEE').format(date);
  }

return Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Container(
      decoration: BoxDecoration(
        color: isNewDay?Color.fromRGBO(205, 212, 228, 0.2):Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              hour.toString(),
              style: TextStyle(color: Colors.black54, fontSize: 17),
            ),
            Text(
              textDay,
              style: TextStyle(color: Colors.black87,fontSize: 18),
            ),
            Container(
              padding: EdgeInsets.all(2),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(50),
              ),
              child:       Center(
                child: Text(
                  weatherIcon,
                  style: TextStyle(fontSize:30),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  minTemperature.toString() + "°",
                  style: TextStyle(
                    color: Colors.blue,
                    // fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  maxTemperature.toString() + "°",
                  style: TextStyle(
                    color: Colors.blue,
                    // fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
