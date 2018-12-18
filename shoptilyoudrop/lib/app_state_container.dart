import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/manager/auth_manager.dart';
import 'package:shoptilyoudrop/model/app_state.dart';
import 'package:shoptilyoudrop/model/signin_model.dart';
import 'package:shoptilyoudrop/model/signup_model.dart';

class AppStateContainer extends StatefulWidget{
  final AppState state;
  final Widget child;
  final IAuthManager authManager;

  AppStateContainer({
    @required this.child,
    @required this.authManager,
    this.state
  });
  
  static _AppStateContainerState of(BuildContext context) {
    return(context.inheritFromWidgetOfExactType(_InheritedAppStateContainer)
           as _InheritedAppStateContainer)
           .data;
  }

  @override
  State<StatefulWidget> createState() => new _AppStateContainerState(authManager: authManager);

}

class _AppStateContainerState extends State<AppStateContainer>{
  AppState state;
  AuthManager authManager;

  _AppStateContainerState({this.authManager});

  @override
  void initState(){
    super.initState();
    if(widget.state != null){
      state = widget.state;
    }else{
      state = new AppState();
    }
  }

  Future<bool> signIn(SignInModel signInModel) async{
    try{
      var user = await authManager.signIn(signInModel);
      if(user != null){
        state.user = user;
        return true;
      }
    }catch(error){
      //Log
    }
    return false;
  }

  Future<bool> signUp(SignUpModel signUpModel) async {
    try{
      var user = await authManager.signUp(signUpModel);
      if(user != null){
        state.user = user;
        return true;
      }
    }catch(error){
      //Log
    }
    return false;
  }

  Future<Null> signOut() async {
    try{
      await authManager.signOut();
    }catch(error){
      //Log
    }
    state.user = null;
  }
  
  Future<FirebaseUser> getUser() async {
    if(state.user == null){
      state.user = await authManager.getUser();
    }
    return state.user;
  }
  
  @override
  Widget build(BuildContext context) {
    return new _InheritedAppStateContainer(
      data: this,
      child: widget.child
    );
  }

}

class _InheritedAppStateContainer extends InheritedWidget{
  final _AppStateContainerState data;

  _InheritedAppStateContainer({
    Key key,
    @required this.data,
    @required Widget child
  }) : super(key:key, child: child);

  @override
  bool updateShouldNotify(_InheritedAppStateContainer oldWidget) => true;

}