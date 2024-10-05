import 'package:flutter/widgets.dart';
import 'package:nhom_17/common/widgets/shimmers/shimmer_effect.dart';

class ListTileShimmer extends StatelessWidget {
  const ListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            ShimmerEffect(width: 50, height: 50, radius: 50,),
            SizedBox(width: 4,),
            Column(
              children: [
                ShimmerEffect(width: 100, height: 15),
                SizedBox(height: 2,),
                ShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}