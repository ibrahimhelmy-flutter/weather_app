import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FiveDayWeather extends StatelessWidget {
  const FiveDayWeather({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          children: <Widget>[
            for (var i = 0; i <5; i++)
              forecastElement(i + 1, "12", "13", "66"),
          ],
        ),
      ),
    );
  }
}

Widget forecastElement(
    daysFromNow, abbreviation, minTemperature, maxTemperature) {
  var now = new DateTime.now();
  var oneDayFromNow = now.add(new Duration(days: daysFromNow));
  return Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(205, 212, 228, 0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              new DateFormat.E().format(oneDayFromNow),
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            Text(
              new DateFormat.MMMd().format(oneDayFromNow),
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Image.asset(
                "assets/images/sun5.png",
                width: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  minTemperature.toString()+"°" ,
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
                SizedBox(width: 10,),
                Text(
                  maxTemperature.toString() +"°" ,
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),

              ],
            ),
          ],
        ),
      ),
    ),
  );
}
