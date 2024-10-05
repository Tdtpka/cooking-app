import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class CustomRatingBarIndicator extends StatelessWidget {

  final double rating;
  final double itemSize;
  final Color iconColor;
  final Color unratedColor;
  const CustomRatingBarIndicator({
    super.key,
    required this.rating,
    this.itemSize = 20,
    this.iconColor = Colors.amber,
    this.unratedColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: itemSize,
      unratedColor: unratedColor.withOpacity(0.1),
      itemBuilder: (_, __) => Icon(Iconsax.star1, color: iconColor,),
    );
  }
}
