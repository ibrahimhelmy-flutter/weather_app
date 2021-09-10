import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:fluttertoast/fluttertoast.dart';


void buildShowToast({required String msg, required Color color}) {
  Fluttertoast.showToast(
      msg: msg,
      backgroundColor: color,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}

String? validateSearchField(String value) {
  int count = value.length - value.replaceAll(",","").length;
  print(count);
  if ((count<2 ||count>6) && value.isNotEmpty) {
    return "Password should contain between  3 to 7 city";
  }
  return null;
}

List<String> splitInputByComma(String cityNames) {
  final splitNames = cityNames.split(',');
  List<String> splitList = [];
  for (int i = 0; i < splitNames.length; i++) {
    splitList.add(splitNames[i]);
  }
  return splitList;
}




String getWeatherIcon(int condition) {
  if (condition < 300) {
    return '🌩';
  } else if (condition < 400) {
    return '🌧';
  } else if (condition < 600) {
    return '☔️';
  } else if (condition < 700) {
    return '☃️';
  } else if (condition < 800) {
    return '🌫';
  } else if (condition == 800) {
    return '☀️';
  } else if (condition <= 804) {
    return '☁️';
  } else {
    return '🤷‍';
  }
}