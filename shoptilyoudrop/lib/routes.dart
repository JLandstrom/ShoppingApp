import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/screens/Categories/categories_overview_page.dart';
import 'package:shoptilyoudrop/screens/home_page.dart';
import 'package:shoptilyoudrop/screens/login/auth_page.dart';

class Routes{
  static final Map<String, WidgetBuilder> routes = {
    homePage: (BuildContext context) => new HomePage(),
    categoriesOverview: (BuildContext context) => new CategoriesOverviewPage()

  };

  static final String homePage = "/home";
  static final String authPage = "/";
  static final String categoriesOverview = "/categories_overview";
}