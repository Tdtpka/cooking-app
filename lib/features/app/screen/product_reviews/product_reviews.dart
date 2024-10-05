import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhom_17/common/widgets/appbar/appbar.dart';
import 'package:nhom_17/common/widgets/foods/ratings/custom_rating_bar_indicator.dart';
import 'package:nhom_17/features/app/screen/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:nhom_17/features/app/screen/product_reviews/widgets/user_review_card.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: const Text("Reviews & Ratings"), showBackArrow: true, leadingOnPress: ()=>Get.back(),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Ratings and review are verified and are from people who cook the food that you see"),
              const SizedBox(height: 4,),
              const OverallProductRating(rating: "4.8",),
              const CustomRatingBarIndicator(rating: 4.8, itemSize: 18,),
              Text("12,333", style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: 8,),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),

            ],
          ),
        ),
      ),
    );
  }
}
