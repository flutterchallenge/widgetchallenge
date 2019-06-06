import 'dart:ui';

import 'package:flutter/material.dart';

class RectangularClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    Rect rectange = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    return rectange;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class PentagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 40);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 20);

    var firstStartPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstStartPoint.dx, firstStartPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondStartPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondStartPoint.dx, secondStartPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

//@Widgets
// Color container
_coloredContainer() => Container(color: Colors.teal, height: 200);
//----------------------------------
//triangle

_triangleWidget() =>
    ClipPath(clipper: TriangleClipper(), child: _coloredContainer());

//Rectangle
_rectangeWidget() => ClipRect(
      clipper: RectangularClipper(),
      child: _coloredContainer(),
    );

//pentagon
_pentagonWidget() => ClipPath(
      clipper: PentagonClipper(),
      child: _coloredContainer(),
    );

//oval
_ovalWidget() => ClipOval(
      child: _coloredContainer(),
    );

//wave
_waveWidget() => ClipPath(
      clipper: WaveClipper(),
      child: _coloredContainer(),
    );

class MyCustomClipper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom clippers"),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 8.0,),
          Text("Triangle Clipper", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          SizedBox(height: 16.0,),
          _triangleWidget(),
           SizedBox(height: 16.0,),
          Text("Rectangle Clipper", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          SizedBox(height: 8.0,),
          _rectangeWidget(),
          SizedBox(height: 16.0,),
          Text("Pentagon Clipper", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          SizedBox(height: 8.0,),
          _pentagonWidget(),
          SizedBox(height: 16.0,),
          Text("Oval Clipper", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          SizedBox(height: 8.0,),
          _ovalWidget(),
          SizedBox(height: 8.0,),
          Text("Wave Clipper", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          SizedBox(height: 16.0,),
          _waveWidget()
        ],
      ),
    );
  }
}
