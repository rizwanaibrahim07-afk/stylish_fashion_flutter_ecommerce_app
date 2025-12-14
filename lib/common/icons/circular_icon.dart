

 import 'package:flutter/material.dart';

import '../../utils/helpers/helperfunctions.dart';

class SCircularIcon extends StatelessWidget {
  const SCircularIcon({
    super.key, required this.icon,  required this.color, this.onPressed,
    this.width, this.height, this.size, this.backgroundColor,
  });
  final double?width,height,size;
   final Color color;
   final IconData icon;
   final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
   final dark=SHelperFunctions.isDarkMode(context);
    return Container(width: width,height: height,
        decoration:BoxDecoration(borderRadius: BorderRadius.circular(100),
        color:backgroundColor!=null?backgroundColor!
            :dark? Colors.black12:Colors.white38),padding: EdgeInsets.zero,
      child: IconButton(onPressed: onPressed, icon:Icon(icon,color: color,size: size,),),);
  }
}