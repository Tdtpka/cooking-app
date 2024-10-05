import 'package:flutter/material.dart';

class CustomCurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0, size.height-20);
    final firstCurve = Offset(100, size.height - 20);
    final lastCurve = Offset(30, size.height - 40);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);
    final secondFirstCurve = Offset(0, size.height - 50);
    final secondLastCurve = Offset(size.width - 60, size.height - 47);
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy, secondLastCurve.dx, secondLastCurve.dy);
    final thirdFirstCurve = Offset(size.width-30, size.height - 90);
    final thirdLastCurve = Offset(size.width-700, size.height-100);
    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy, thirdLastCurve.dx, thirdLastCurve.dy);

    final fourthFirstCurve = Offset(size.width - 5, size.height + 30);
    final fourthLastCurve = Offset(size.width, size.height-100);
    path.quadraticBezierTo(fourthFirstCurve.dx, fourthFirstCurve.dy, fourthLastCurve.dx, fourthLastCurve.dy);


    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper){
    return true;
  }
}