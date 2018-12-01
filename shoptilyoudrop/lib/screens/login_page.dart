import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/screens/login/login_fields.dart';
import 'package:shoptilyoudrop/screens/login/login_header.dart';
import 'package:shoptilyoudrop/screens/login/signup_fields.dart';
import 'package:shoptilyoudrop/service/authentication_service.dart';
import 'package:shoptilyoudrop/utils/constants.dart';
import 'package:shoptilyoudrop/manager/session_manager.dart';
import 'package:shoptilyoudrop/routes.dart';
import 'package:shoptilyoudrop/utils/extensions/string_extensions.dart';

class LoginPage extends StatefulWidget {
  final UserService _userService;
  LoginPage(this._userService, {Key key}) : super(key:key);

  @override
    LoginPageState createState() => new LoginPageState(_userService);
}

class LoginPageState extends State<LoginPage> {
  final UserService _userService;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLogin;


  LoginPageState(this._userService);

  @override
  void initState() {
    super.initState();
    _isLogin = true;
    _checkSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: loginBody(),
      ),
    );
  }

  loginBody() => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[new LoginHeader(), _isLogin ? new LoginFields(_userService,stateCallback) : new SignUpFields(_userService, stateCallback)],
        ),
      );

    void _checkSession() async{
      var token = await SessionManager().getToken();
      if(token != null){
        var user = await _userService.getUser(token);
        if(user != null){
          SessionManager().setUserDetails(user);
          Future((){
            Navigator.of(context).pushReplacementNamed(Routes.homePage);
          });
        }
        else{
          SessionManager().setToken("");
        }
      }
    }

    void stateCallback(bool isLogin){
      setState((){
        _isLogin = isLogin;
      });
    }
}
