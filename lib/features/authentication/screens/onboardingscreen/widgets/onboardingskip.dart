import 'package:flutter/material.dart';

import '../../../../../utils/constants/size.dart';
import '../../../controllers/onboarding_controller.dart';
class onboardingskip extends StatelessWidget {
  const onboardingskip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(right:SSizes.defaultSpace,top: kToolbarHeight,child: TextButton(onPressed: (){
      OnBoardingController.instance.skipPage();
    }, child: const Text('Skip')));
  }
}