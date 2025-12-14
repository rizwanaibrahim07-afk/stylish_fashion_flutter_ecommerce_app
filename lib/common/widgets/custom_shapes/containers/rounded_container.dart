import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
class SRoundedContainer extends StatelessWidget {
  const SRoundedContainer({super.key, this.height, this.width, this.radius=SSizes.cardRadiusLg,
    this.padding, this.margin, this.backgroundColor=SColors.white, this.child,
    this.borderColor=SColors.primary, this.showborder=false});
 final double ?height;
 final double?width;
 final double radius;
 final EdgeInsetsGeometry? padding;
 final EdgeInsetsGeometry?margin;
 final Color backgroundColor;
 final Widget? child;
 final Color borderColor;
 final bool showborder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showborder?Border.all(color: borderColor):null,
      ),
      child: child,
    );
  }
}
