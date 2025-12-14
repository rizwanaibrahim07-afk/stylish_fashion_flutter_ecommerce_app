import 'package:flutter/material.dart';


import '../../../../utils/constants/colors.dart';
import '../../Scurvededgewidget.dart';
import 'circularcontainer.dart';
class primaryheadercontainer extends StatelessWidget {
  const primaryheadercontainer({
    super.key,required this.child,
  });
final Widget child;
  @override
  Widget build(BuildContext context) {
    return ScurvedEdgeWidget(
      child: Container(
        color:SColors.primary,
        padding: EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(top:100,right:-250,child: SCircularContainer(backgroundcolor: Colors.white38)),
            Positioned(top:-100,right:-250,child: SCircularContainer(backgroundcolor: Colors.white38)),
            child,
          ],
        ),),
    );
  }
}
