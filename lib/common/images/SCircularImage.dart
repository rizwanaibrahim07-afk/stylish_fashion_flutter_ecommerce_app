import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/size.dart';
import '../../utils/helpers/helperfunctions.dart';
class SCircularImage extends StatelessWidget {
  const SCircularImage({
    super.key,  this.fit, this.isNetworkImage=false,
    this.backgroundColor, this.overlayColor, this.width, this.height,
    this.padding=const EdgeInsets.all(SSizes.md), required this.image,
  });
  final BoxFit? fit;
  final bool? isNetworkImage;
  final Color? backgroundColor,overlayColor;
  final double? width,height;
  final EdgeInsetsGeometry padding;
  final String image;
  @override
  Widget build(BuildContext context) {
    final dark=SHelperFunctions.isDarkMode(context);
    return Container(
        width:width,
        height:height,
        padding: padding,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
          color: Colors.transparent,

        ),
        child:
        Image(image:!isNetworkImage!? NetworkImage(image):AssetImage(image) as ImageProvider,
        fit: fit,color:overlayColor));
  }
}