import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/manager/session_manager.dart';
import 'package:shoptilyoudrop/routes.dart';
import 'package:shoptilyoudrop/screens/login_page.dart';
import 'package:shoptilyoudrop/service/authentication_service.dart';
import 'package:shoptilyoudrop/utils/constants.dart';
import 'package:shoptilyoudrop/utils/extensions/string_extensions.dart';
import 'package:shoptilyoudrop/utils/helpers.dart';

class LoginFields extends StatelessWidget{
  final UserService _userService;
  final Function _stateCallback;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginFields(this._userService, this._stateCallback);

  @override
  Widget build(BuildContext context){
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
            child: TextField(
              controller: _usernameController,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "Enter your username",
                labelText: "Username",
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            child: TextField(
              controller: _passwordController,
              maxLines: 1,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter your password",
                labelText: "Password",
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
            width: double.infinity,
            child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                shape: StadiumBorder(),
                child: Text(
                  "SIGN IN",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                color: Colors.green,
                onPressed: () => _signIn(context)
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "----"
              ),
              Text(
                "OR",
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                  "----"
              )
            ],
          ),
          SizedBox(
            height: 25.0,
          ),
          GestureDetector(
            onTap: (){ _stateCallback(false); } ,
            child: Text(
              "SIGN UP FOR AN ACCOUNT",
              style: TextStyle(color: Colors.grey, fontSize: 16.0),
            ),
          )
        ],
      ),
    );
  }

  void _signIn(BuildContext context) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    var token = await _userService.authenticate(_usernameController.text, _passwordController.text);
    if(StringExtensions.IsNullOrEmpty(token)){
      Helpers.showSnackBar(context,_userService.latestError());
    }
    else{
      var user = await _userService.getUser(token);
      if(user != null){
        SessionManager().setToken(token);
        SessionManager().setUserDetails(user);
        Navigator.of(context).pushReplacementNamed(Routes.homePage);
      }
      else{
        if(StringExtensions.IsNullOrEmpty(_userService.latestError()))
          Helpers.showSnackBar(context,Constants.Error.InvalidLogin);
        else
          Helpers.showSnackBar(context,_userService.latestError());
      }
    }
  }
}