import 'package:evently/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class Toasts{
  static void showToast(Color toastColor, String msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: toastColor,
      textColor: ColorsManager.white,
      fontSize: 16.0,
    );
  }
}