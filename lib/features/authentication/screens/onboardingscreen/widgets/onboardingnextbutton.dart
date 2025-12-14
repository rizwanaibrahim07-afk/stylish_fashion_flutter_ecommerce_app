import 'package:flutter/material.dart';

import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helperfunctions.dart';
import '../../../controllers/onboarding_controller.dart';
class onboardingnextbutton extends StatelessWidget {
  const onboardingnextbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=OnBoardingController.instance;
    final dark=SHelperFunctions.isDarkMode(context);
    return Positioned(right:SSizes.defaultSpace,
        bottom:kBottomNavigationBarHeight,
        child: ElevatedButton(onPressed: (){
          controller.nextPage();
        },style:ElevatedButton.styleFrom(foregroundColor: dark?Colors.black:Colors.white,
            backgroundColor: dark?Colors.white:Colors.black),child: const Icon(Icons.arrow_right_alt) ,
        ));
  }
}

