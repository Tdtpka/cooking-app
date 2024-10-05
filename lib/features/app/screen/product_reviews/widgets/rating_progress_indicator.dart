import 'package:flutter/material.dart';
import 'package:nhom_17/features/app/screen/product_reviews/widgets/progress_indicator_and_rating.dart';

class OverallProductRating extends StatelessWidget {

  final String rating;
  const OverallProductRating({
    super.key,
    required this.rating
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(rating, style: Theme.of(context).textTheme.displayLarge,)),
          const Expanded(
            flex: 7,
            child: Column(
              children: [
                RatingProgressIndicator(text: "5", value: 1,),
                RatingProgressIndicator(text: "4", value: 0.8,),
                RatingProgressIndicator(text: "3", value: 0.6,),
                RatingProgressIndicator(text: "2", value: 0.4,),
                RatingProgressIndicator(text: "1", value: 0.2,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
