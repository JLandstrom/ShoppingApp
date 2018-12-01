import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

class CustomAppBar extends AppBar{
  CustomAppBar(String title, {bool centerTitle = true, Color backgroundColor = Colors.green})
      : super(title: Text(title), centerTitle: centerTitle, backgroundColor: backgroundColor);
}