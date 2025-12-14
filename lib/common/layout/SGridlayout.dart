import 'package:flutter/material.dart';

import '../../utils/constants/size.dart';
class SGridlayout extends StatelessWidget {
  const SGridlayout({
    super.key, required this.itemCount, this.mainAxisExtent=288, required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget?Function(BuildContext,int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(itemCount: itemCount,shrinkWrap: true,padding: EdgeInsets.zero,
      physics:const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.7,
        mainAxisSpacing: SSizes.gridViewSpacing,
        crossAxisSpacing: SSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder:itemBuilder,
    );
  }
}

