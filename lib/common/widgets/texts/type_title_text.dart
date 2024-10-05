import 'package:flutter/material.dart';

class TypeTitleText extends StatelessWidget {
  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final String typeTextSize;
  const TypeTitleText({
    super.key,
    this.color,
    required this.title,
    this.maxLines = 1,
    this.textAlign = TextAlign.center, 
    this.typeTextSize = "small"
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: typeTextSize == "small"
      ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
      : typeTextSize == "medium"
      ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
      : typeTextSize == "large"
      ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
      :Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}