import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoptilyoudrop/utils/constants.dart';
import 'package:shoptilyoudrop/model/user.dart';

class SessionManager{
  static final SessionManager _sessionManager = new SessionManager._internal();

  factory SessionManager(){
    return _sessionManager;
  }

  SessionManager._internal();

  User _user;
  final Future<SharedPreferences> _preferences = SharedPreferences.getInstance();

  Future<void> setToken(String token) async {
    final SharedPreferences preferences = await _preferences;
    preferences.setString(Constants.Authorization.AuthToken, token);
  }

  Future<String> getToken() async {
    final SharedPreferences preferences = await _preferences;
    return preferences.getString(Constants.Authorization.AuthToken);
  }

  void setUserDetails(User user){
    _user = user;
  }

  User getUserDetails(){
    return _user;
  }

  Future<void> signOut(BuildContext context) async {
    final SharedPreferences preferences = await _preferences;
    preferences.setString(Constants.Authorization.AuthToken, null);
    _user = null;
    Navigator.of(context).pushReplacementNamed('/');
  }

}