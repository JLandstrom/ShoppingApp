import 'package:flutter/material.dart';

class Helpers{
  static void showSnackBar(BuildContext context, String message, {duration = 3}){
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ new Text(message) ]
        ),
      duration: duration
    ));
  }
}