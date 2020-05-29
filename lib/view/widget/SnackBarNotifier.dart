import 'package:flutter/material.dart';

class SnackBarNotifier{

  static void showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String value, Color color){
    scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        backgroundColor: color,
        content: Text(value,
          style: TextStyle(
            fontSize: 20
          ),
        ),
        action: SnackBarAction(
          textColor: Colors.white,
          label: "Đã hiểu",
          onPressed: (){
            scaffoldKey.currentState.hideCurrentSnackBar();
          },
        ),
      )
    );
  }
}