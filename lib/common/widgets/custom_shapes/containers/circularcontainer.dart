import 'package:flutter/material.dart';

class SCircularContainer extends StatelessWidget {
  const SCircularContainer({
    super.key, this.width=350, this.height=350, this.radius=350, this.padding=0, this.child,
    this.backgroundcolor=Colors.white38, this.margin,
  });
  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final Widget? child;
  final Color backgroundcolor;
final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,
      height:height,
      margin: margin,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius!),
          color: backgroundcolor),
      child: child,
    );
  }
}