import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/app_state_container.dart';
import 'package:shoptilyoudrop/manager/auth_manager.dart';
import 'package:shoptilyoudrop/model/app_state.dart';
import 'package:shoptilyoudrop/screens/login/login_background.dart';
import 'package:shoptilyoudrop/screens/login/login_body.dart';
import 'package:shoptilyoudrop/screens/login/signup_body.dart';
import 'package:shoptilyoudrop/screens/shared/loading_page.dart';
import 'package:shoptilyoudrop/service/user_service.dart';
import 'package:shoptilyoudrop/routes.dart';
import 'package:shoptilyoudrop/utils/service_locator.dart';


class AuthPage extends StatefulWidget {

  AuthPage({Key key}) : super(key:key);

  @override
    AuthPageState createState() => new AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  bool _isLogin;
  AppState state;

  @override
  void initState() {
    super.initState();
    _isLogin = true;
    _checkSession();
  }

  Widget _authWidget() => new Container(
        decoration: new BoxDecoration(color: Colors.white),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: new Stack(
            children: <Widget>[
              new LoginBackground(),
              _isLogin ? new LoginBody(stateCallback) : new SignUpBody(stateCallback)
            ],
          ),
        )
      );

  @override
  Widget build(BuildContext context){
    var container = AppStateContainer.of(context);
    var isloading = container.state.isLoading;
    return Scaffold(
      body: isloading ? new LoadingScreen(child: _authWidget()) : _authWidget()
    );
  }

  void _checkSession() async {
    Future(() async {
        var container = AppStateContainer.of(context);
        var user = await container.getUser();
        if(user != null){
          Navigator.of(context).pushReplacementNamed(Routes.homePage);
        }
    });
  }

  void stateCallback(bool isLogin){
    setState((){
      _isLogin = isLogin;
    });
  }
}
