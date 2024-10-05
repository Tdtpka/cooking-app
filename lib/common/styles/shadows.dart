import 'package:flutter/material.dart';

class ShadowStyle {
  static final verticalFoodShadow = BoxShadow(
    color: Colors.blueGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
  
  static final horizontalFoodShadow = BoxShadow(
    color: Colors.blueGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}