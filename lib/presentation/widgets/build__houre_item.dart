import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget weatherHourItem(minTemperature, maxTemperature, weatherIcon, dt) {
  var date = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
  var hour = DateFormat("h a").format(date);

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              hour.toString(),
              style: TextStyle(color: Colors.black54, fontSize: 17),
            ),
            Container(
              padding: EdgeInsets.all(2),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  weatherIcon,
                  style: TextStyle(fontSize: 30),
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