import 'package:flutter/material.dart';
import 'package:nhom_17/common/widgets/custom_shape/curved_edges/curved_edges.dart';

class CurvedEdgeWidget extends StatelessWidget {
  final Widget child;
  const CurvedEdgeWidget({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}
