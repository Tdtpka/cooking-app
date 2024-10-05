import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const CircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = 25,
    this.onPressed,
    this.color,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor,
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color, size: size,)),
    );
  }
}