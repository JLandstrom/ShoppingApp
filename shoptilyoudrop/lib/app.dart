

import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/routes.dart';
import 'package:shoptilyoudrop/screens/login/auth_page.dart';

class AppRoot extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new AppRootState();
}

class AppRootState extends State<AppRoot>{
  ThemeData get _themeData => new ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.green,
        scaffoldBackgroundColor: Colors.white 
      );
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My Groceries",
      theme: _themeData,
      home: new AuthPage(),
      routes:  Routes.routes
    );
  }

}