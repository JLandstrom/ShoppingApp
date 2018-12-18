import 'package:flutter/material.dart';
import 'package:shoptilyoudrop/app_state_container.dart';
import 'package:shoptilyoudrop/model/app_state.dart';

class TempHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new TempHomePageState();

}

class TempHomePageState extends State<TempHomePage>{
  AppState appState;

  Widget get _tempPage {
    if(appState.isLoading){
      return _loadingView;
    }
    else{
      return _homeView;
    }
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }
  
  Widget get _homeView {
    return new Center(child: new Text("Välkommen"));
  }

  @override
  Widget build(BuildContext context) {
    var appStateContainer = AppStateContainer.of(context);
    appState = appStateContainer.state;

    return new Scaffold(
      appBar: new AppBar(title: new Text("Test")),
      body: _tempPage
    );
  }

}