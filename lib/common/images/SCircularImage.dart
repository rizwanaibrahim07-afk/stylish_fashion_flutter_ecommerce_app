import 'package:flutter/material.dart';


import '../../utils/constants/size.dart';
import '../../utils/helpers/helperfunctions.dart';
class SCircularImage extends StatelessWidget {
  const SCircularImage({
    super.key,  this.fit, this.isNetworkImage=false,
    this.backgroundColor, this.overlayColor, this.width, this.height,
    this.padding=const EdgeInsets.all(SSizes.md),  this.image,
  });
  final BoxFit? fit;
  final bool isNetworkImage;
  final Color? backgroundColor,overlayColor;
  final double? width,height;
  final EdgeInsetsGeometry padding;
  final String? image;
  @override
  Widget build(BuildContext context) {

    return Container(
        width:width,
        height:height,
        padding: padding,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
          color: Colors.transparent,

        ),
        child:ClipRRect(borderRadius: BorderRadius.circular(100),
            child: Center(

          child: Image(image:isNetworkImage
              ? NetworkImage(image!) as ImageProvider
                    : AssetImage(image!),
          fit: fit,color:overlayColor),
        ),),);
  }
}