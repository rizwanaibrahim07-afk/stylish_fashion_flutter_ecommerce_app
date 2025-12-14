import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
class SRoundedImage extends StatelessWidget {
  const SRoundedImage({
    super.key, required this.imageUrl, this.width, this.height,
    this.applyImageRadius=false, this.backgroundColor=SColors.light, this.fit=BoxFit.contain,
    this.padding,  this.isNetworkImage=false,  this.onPressed, this.border, this.borderRadius=SSizes.md,
  });
  final String imageUrl;
  final double? width,height;
  final bool applyImageRadius;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final BoxBorder? border;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector( onTap: onPressed,
      child: Container(
        width: width,height: height,padding: padding,
        decoration: BoxDecoration(border:border,color:backgroundColor,
            borderRadius:applyImageRadius? BorderRadius.circular(borderRadius):BorderRadius.zero),
        child: ClipRRect(
          borderRadius:BorderRadius.circular(borderRadius),
          child: Image(image:isNetworkImage?NetworkImage(imageUrl): AssetImage(imageUrl) as ImageProvider,fit: fit,),
        ),),
    );
  }
}