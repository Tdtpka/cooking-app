import 'package:flutter/widgets.dart';
import 'package:nhom_17/common/widgets/shimmers/shimmer_effect.dart';

class BoxesShimmer extends StatelessWidget {
  const BoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: ShimmerEffect(width: 150, height: 110)),
            SizedBox(width: 4,),
            Expanded(child: ShimmerEffect(width: 150, height: 110)),
            SizedBox(width: 4,),
            Expanded(child: ShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}