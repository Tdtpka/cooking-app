import 'package:flutter/material.dart';
import 'package:nhom_17/common/widgets/shimmers/shimmer_effect.dart';

class HorizontalFoodsShimmer extends StatelessWidget {
  const HorizontalFoodsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 8,),
        itemCount: itemCount,
        itemBuilder: (_,__) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShimmerEffect(width: 120, height: 120),
            SizedBox(width: 4,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 4,),
                ShimmerEffect(width: 160, height: 15),
                SizedBox(height: 4,),
                ShimmerEffect(width: 110, height: 15),
                SizedBox(height: 4,),
                ShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            )
          ],
        ),
        
      ),
    );
  }
}