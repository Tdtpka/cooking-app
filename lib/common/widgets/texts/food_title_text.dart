import 'package:flutter/material.dart';

class FoodTitleText extends StatelessWidget {

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;
  final bool lineThrough;
  const FoodTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
    this.lineThrough = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
      style: smallSize
      ? Theme.of(context).textTheme.titleMedium!.apply(decoration: lineThrough? TextDecoration.lineThrough : null)
      : Theme.of(context).textTheme.headlineSmall!.apply(decoration: lineThrough? TextDecoration.lineThrough : null),
    );
  }
}