import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/screens/home_page.dart';
class Routes{
  static final Map<String, WidgetBuilder> routes = {
    homePage: (BuildContext context) => new HomePage() 
  };

  static final String homePage = 'home';
}