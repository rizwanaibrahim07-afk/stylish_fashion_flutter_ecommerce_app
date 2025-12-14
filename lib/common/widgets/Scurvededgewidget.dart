import 'package:flutter/material.dart';

import 'custom_shapes/curvededges/curvededges.dart';
class ScurvedEdgeWidget extends StatelessWidget {
  const ScurvedEdgeWidget({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return  ClipPath(
      clipper: SCustomCurvedEdges(),
      child: child,);
  }
}
