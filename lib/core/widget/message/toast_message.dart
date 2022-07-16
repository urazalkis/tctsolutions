import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage{
  static ToastMessage instance = ToastMessage._init();
  ToastMessage._init();
  Future<void> success({String? message}) {
    return Fluttertoast.showToast(
      msg: "$message",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.green,

    );
  }

  Future<void> errorMessage({String? errorMessage}) {
    return Fluttertoast.showToast(
        msg: "$errorMessage",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blueGrey,
      textColor: Colors.white

    );
  }
  Future<void> standardErrorMessage() {
    return Fluttertoast.showToast(
      msg: "An Error Occured!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.blueGrey,

    );
  }

  Future<void> dbConnectionErrorMessage() {
    return Fluttertoast.showToast(
      msg: "DB Connection Error!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.blueGrey,
    );
  }



}