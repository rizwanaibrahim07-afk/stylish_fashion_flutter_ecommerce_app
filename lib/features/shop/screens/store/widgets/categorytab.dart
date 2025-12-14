import 'package:flutter/material.dart';


import '../../../../../common/layout/SGridlayout.dart';
import '../../../../../common/widgets/ssectionheader.dart';
import '../../../../../utils/constants/image_string.dart';
import '../../../../../utils/constants/size.dart';
import '../../widgets/vertical_product_card.dart';
import 'SBrandShowcase.dart';
class SCategoryTab extends StatelessWidget {
  const SCategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
      children: [ Padding(padding: EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          children: [
            //brands
            SBrandshowcase(images: [SImages.shoes3,SImages.shoes4,SImages.shoes2],),
            const SizedBox(height: SSizes.spaceBtwItem,),
            SBrandshowcase(images: [SImages.shoes1,SImages.shoes12,SImages.shoes11],),
            const SizedBox(height: SSizes.spaceBtwItem,),
            SSectionHeader(title: 'You might be like',onPressed: (){},),
            const SizedBox(height: SSizes.spaceBtwItem,),
            SGridlayout(itemCount: 4, itemBuilder:(_,index){}),
            const SizedBox(height: SSizes.spaceBtwItem,),
          ],
        ),),],
    );
  }
}
