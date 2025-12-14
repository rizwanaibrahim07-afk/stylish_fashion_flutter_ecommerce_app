import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/model/product_model.dart';
import 'package:stylish_fashion/features/shop/screens/store/widgets/brand_card.dart';
import 'package:stylish_fashion/features/shop/screens/store/widgets/categorytab.dart';

import '../../../../common/layout/SGridlayout.dart';
import '../../../../common/widgets/appbar/Stabbar.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/cartcounter/cartcounter.dart';
import '../../../../common/widgets/searchbar/searchbar.dart';
import '../../../../common/widgets/ssectionheader.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helperfunctions.dart';
import '../All Brands/all_brands.dart';
class StoreScreen extends StatelessWidget {

  const StoreScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    final dark=SHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: SAppbar(title:Text('Store',style: Theme.of(context).textTheme.headlineMedium,),
        actions: [CartCounter(),
        ],),
        //body
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled){
          return[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: dark?SColors.black:SColors.white,
              expandedHeight: 440,
              flexibleSpace: Padding(padding: EdgeInsets.all(SSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: SSizes.spaceBtwItem,),
                   SSearchBar(showBorder: true,showBackground: false,padding: EdgeInsets.symmetric(horizontal:0),),
                    SizedBox(height: SSizes.spaceBtwSections,),

                    //featured brands
                    SSectionHeader(title: 'Featured Brands',onPressed: ()=>Get.to(AllBrandsScreen())),
                    SizedBox(height: SSizes.spaceBtwItem/2,),
                    SGridlayout(itemCount: 4,mainAxisExtent: 60, itemBuilder: (_,index){
                    return SBrandCard(showBorder: true);}),
                  ],
                ),
            ),
            bottom: const STabbar(
              tabs: [
                 Tab(child:Text('Clothes')),
                 Tab(child:Text('Footwear')),
                 Tab(child:Text('Accessories'))],),

            ),
          ];
        },

          body:TabBarView(children: [
            SCategoryTab(),SCategoryTab(),SCategoryTab()
          ],
              ),
        ),
      ),
    );
  }
}







