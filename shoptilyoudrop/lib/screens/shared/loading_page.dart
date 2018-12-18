
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget{
  Widget child;

  LoadingScreen({
    @required this.child
  });

  Widget _splashScreen(BuildContext context) => new Opacity(
    opacity: 0.5,
    child: new Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Center(
        child: Container(
          width: 50.0,
          height: 50.0,
          child: new CircularProgressIndicator()
        )
      )
    )
  );
  

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Stack(
        children: <Widget>[
          child,
          _splashScreen(context)
        ],
      )
    );
  }

}