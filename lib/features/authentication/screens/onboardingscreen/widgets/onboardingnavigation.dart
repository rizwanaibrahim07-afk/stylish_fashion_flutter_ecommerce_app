import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/size.dart';
import '../../../../../utils/helpers/helperfunctions.dart';
import '../../../controllers/onboarding_controller.dart';
class onboardingnavigation extends StatelessWidget {
  const onboardingnavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   final controller=OnBoardingController.instance;
    final dark=SHelperFunctions.isDarkMode(context);
    return Positioned(bottom: kBottomNavigationBarHeight + 25,
        left: SSizes.defaultSpace,
        child:SmoothPageIndicator(
            controller: controller.pageController,count: 3,onDotClicked: controller.dotNavigationClick,
            effect: ExpandingDotsEffect(activeDotColor:dark?SColors.light: SColors.dark,dotHeight: 6,)));
  }
}