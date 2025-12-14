import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/layout/SGridlayout.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/ssectionheader.dart';
import '../../../../utils/constants/size.dart';
import '../store/widgets/brand_card.dart';
import 'brand_prouct.dart';
class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: SAppbar(title:Text('Brand'),showBackArrow: true,),
    body: SingleChildScrollView(child: 
      Padding(padding: EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
        children: [
          SSectionHeader(title: 'Brands',actionButton: false,),
          SizedBox(height: SSizes.spaceBtwItem,),
          SGridlayout(itemCount: 10,mainAxisExtent: 80, itemBuilder: (context,index)=>SBrandCard(showBorder: true,
            onTap: ()=>Get.to(()=>BrandProuct()),))
        ],
      ),),),);
  }
}
