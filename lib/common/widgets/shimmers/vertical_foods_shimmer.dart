import 'package:flutter/material.dart';
import 'package:nhom_17/common/widgets/layouts/grid_layout.dart';
import 'package:nhom_17/common/widgets/shimmers/shimmer_effect.dart';

class VerticalFoodsShimmer extends StatelessWidget {
  final int itemCount;
  const VerticalFoodsShimmer({super.key, this.itemCount = 4});

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerEffect(width: 180, height: 180),
            SizedBox(height: 4,),
            ShimmerEffect(width: 160, height: 15),
            SizedBox(height: 2,),
            ShimmerEffect(width: 110, height: 15)
          ],
        ),
      )
    );
  }
}