
import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ClipPath(
          child: new Container(
              height: MediaQuery.of(context).size.height/2,
              decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight,
                      colors: [
                        Colors.blue[800],
                        Colors.blue[200]
                      ]
                  )
              ),
              child: new Center(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Image(image: AssetImage("assets/logo4.v3.png"), width: 250, height: 250,)
                    ],
                  )
              )

          ),
          clipper: ArcClipper(),
        )
      ],
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This is where we decide what part of our image is going to be
    // visible. If you try to run the app now, nothing will be shown.
    Path path = Path();

    path.lineTo(0.0, size.height-60.0);

    var controlPoint = new Offset(size.width/2, size.height);
    var endPoint = new Offset(size.width, size.height-60.0);

    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}