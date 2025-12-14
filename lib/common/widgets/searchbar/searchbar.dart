
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_fashion/features/shop/controllers/Search_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helpers/helperfunctions.dart';

class SSearchBar extends StatelessWidget {
final  controller=Get.put(SearchProductController());
   SSearchBar({
    super.key,  this.showBackground=true,  this.showBorder=true,
    this.padding=const EdgeInsets.symmetric(horizontal: SSizes.defaultSpace)
  });

 final EdgeInsetsGeometry padding;
  final bool showBackground,showBorder;
  @override
  Widget build(BuildContext context) {
    final dark=SHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.08,

        decoration: BoxDecoration(color:showBackground?dark?SColors.white:SColors.light: Colors.transparent,
            borderRadius: BorderRadius.circular(SSizes.cardRadiusMd),
            border: showBorder?Border.all(color: dark?SColors.dark:Colors.grey):null),
        child: Center(
                    child: Column(
                      children: [
                        TextField(onChanged:(value){controller.performSearch(value); },
                            decoration:InputDecoration(hintText:"Search",prefixIcon: Icon(Icons.search),)),


                      ],
                    ),





        ),
      ),
    );
  }
}


