import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const RoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = 16,
    this.child,
    this.showBorder = false,
    this.borderColor = const Color(0xFFD9D9D9),
    this.backgroundColor = Colors.white,
    this.padding,
    this.margin
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder? Border.all(color: borderColor): null,
      ),
      child: child,
    );
  }
}