import 'package:flutter/material.dart';

import '../../../../../common/images/SCircularImage.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enum.dart';
import '../../../../../utils/constants/image_string.dart';
import '../../../../../utils/constants/size.dart';
import 'brand_title_text.dart';
class SBrandCard extends StatelessWidget {
  const SBrandCard({
    super.key, required this.showBorder, this.onTap,
  });
  final bool showBorder;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector( onTap: onTap,
        child: SRoundedContainer(showborder: showBorder,backgroundColor: SColors.lightContainer,
        child:
      Row(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(child: SCircularImage(image: SImages.cloth1,width: 46,height:46,backgroundColor: Colors.transparent,)),
          SizedBox(width: SSizes.sm/6,),
          Expanded(
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SBrandTitleText(title: 'Nike',brandTitlesize: TextSizes.large,),
                  SizedBox(height: SSizes.sm/2,),
                  Text('256 products',maxLines: 1,overflow: TextOverflow.ellipsis,)
                ] ),
          )
        ],
      ),),
    );
  }
}


