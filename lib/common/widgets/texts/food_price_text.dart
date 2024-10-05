import 'package:flutter/material.dart';

class FoodPriceText extends StatelessWidget {
  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;
  const FoodPriceText({
    super.key,
    this.currencySign = "h",
    required this.price,
    this.isLarge = false,
    this.maxLines = 1,
    this. lineThrough = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$price $currencySign",
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
      ? Theme.of(context).textTheme.titleMedium!.apply(decoration: lineThrough? TextDecoration.lineThrough : null)
      : Theme.of(context).textTheme.titleSmall!.apply(decoration: lineThrough? TextDecoration.lineThrough : null),
    );
  }
}