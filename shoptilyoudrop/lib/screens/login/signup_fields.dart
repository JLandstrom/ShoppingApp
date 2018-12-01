import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/service/authentication_service.dart';

class SignUpFields extends StatelessWidget{
  final UserService _userService;
  final Function _stateCallback;

  SignUpFields(this._userService, this._stateCallback);

  @override
  Widget build(BuildContext context){
    return new Column();
  }
}