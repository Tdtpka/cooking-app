import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget{
  
  final double? width, height;
  final double radius, padding;
  final EdgeInsets? margin;
  final Color backgroundColor;
  final Widget? child;

  const CircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.margin = EdgeInsets.zero,
    this.backgroundColor = Colors.white,
    this.child
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
  
}