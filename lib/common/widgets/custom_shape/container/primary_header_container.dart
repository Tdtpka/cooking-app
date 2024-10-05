import 'package:flutter/material.dart';
import 'package:nhom_17/common/widgets/custom_shape/container/circular_container.dart';
import 'package:nhom_17/common/widgets/custom_shape/curved_edges/curved_edge_widget.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  final Widget child;
  final double height;
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
    this.height = 350
    });
  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: SizedBox(
        height: height,
        child: Container(
          color: Colors.amberAccent,
          child: Stack(
            children: [
              Positioned(top: -150, right: -250, child: CircularContainer(backgroundColor: Colors.white.withOpacity(0.1),)),
              Positioned(top: 100, right: -300, child: CircularContainer(backgroundColor: Colors.white.withOpacity(0.1),)),
              child,
            ],
          ),
        ),
      )
    );
  }
}