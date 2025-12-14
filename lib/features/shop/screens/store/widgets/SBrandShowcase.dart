import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helperfunctions.dart';
import 'brand_card.dart';

class SBrandshowcase extends StatelessWidget {
  const SBrandshowcase({
    super.key, required this.images,

  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark=SHelperFunctions.isDarkMode(context);
    return SRoundedContainer(
      showborder: true,
      backgroundColor: Colors.transparent,
      borderColor: SColors.darkerGrey,
      margin: const EdgeInsets.only(bottom: SSizes.spaceBtwItem),
      child: Column(
        children: [
          const SBrandCard(showBorder: false),
          Row(
              children: images.map((image)=>brandTopProduct(image, context)).toList()
          )
        ],
      ),

    );
  }

  Widget brandTopProduct(String image,context){
    final dark=SHelperFunctions.isDarkMode(context);
    return Expanded(
      child: SRoundedContainer(backgroundColor: Colors.transparent,
        height: 100,borderColor: dark?SColors.darkerGrey:SColors.light,
        margin: EdgeInsets.only(right: SSizes.sm),
        padding:EdgeInsets.all(SSizes.md/2),
        child:  Image(image: AssetImage(image)),
      ),
    );
  }
}
