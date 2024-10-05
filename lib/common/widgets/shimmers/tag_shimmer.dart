import 'package:flutter/material.dart';
import 'package:nhom_17/common/widgets/shimmers/shimmer_effect.dart';

class TagShimmer extends StatelessWidget {

  const TagShimmer({super.key, this.itemCount = 6});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: 10,),
        itemBuilder: (_, __){
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerEffect(width: 55, height: 55, radius: 55,),
              SizedBox(height: 5,),
              ShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}