import 'package:flutter/material.dart';
import 'package:nhom_17/common/widgets/layouts/grid_layout.dart';
import 'package:nhom_17/common/widgets/shimmers/shimmer_effect.dart';

class TypeShimmerEffect extends StatelessWidget {
  const TypeShimmerEffect({super.key, this.itemCount = 4});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: itemCount,
      itemBuilder: (_,__) => const ShimmerEffect(width: 300, height: 80)
    );
  }
}