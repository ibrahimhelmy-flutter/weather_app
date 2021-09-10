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