import 'package:flutter/material.dart';
import 'package:nhom_17/common/widgets/foods/ratings/custom_rating_bar_indicator.dart';
import 'package:nhom_17/common/widgets/images/circular_image.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(top: 8,left: 20,right: 10,bottom: 20),
      decoration: BoxDecoration(
        color: Colors.amber.shade300,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(50), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(10))
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 20,),
                  const CircularImage(image: "images/avatar_default.jpg", isNetworkImage: false,width: 35, height: 35,padding: 0,),
                  const SizedBox(width: 10,),
                  Text("mtam", style: Theme.of(context).textTheme.bodyLarge,)
                ],
              ),
              IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
            ],
          ),
          const SizedBox(height: 2,),
          Row(
            children: [
              const CustomRatingBarIndicator(rating: 4, itemSize: 15, iconColor: Colors.white, unratedColor: Colors.black),
              const SizedBox(width: 16,),
              Text("01 Nov, 2023", style: Theme.of(context).textTheme.bodyMedium,)
            ],
          ),
          const SizedBox(height: 2,),
          const ReadMoreText(
            "dwudnuwnudnuwndunwdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddunduwnduwnudnwudeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeednuwdnuwnduwnduwndbwudb",
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: "show more",
            trimExpandedText: "show less",
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5,),
        ],
      ),
    );
  }
}