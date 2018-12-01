import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/utils/constants.dart';

class LoginHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlutterLogo(
          colors: Colors.green,
          size: 80.0,
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          "Welcome to ${Constants.App.AppTitle}",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          "Sign in to continue",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}