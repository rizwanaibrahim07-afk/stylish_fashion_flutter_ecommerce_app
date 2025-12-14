import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:stylish_fashion/features/authentication/screens/onboardingscreen/widgets/onboardingnavigation.dart";
import "package:stylish_fashion/features/authentication/screens/onboardingscreen/widgets/onboardingnextbutton.dart";
import "package:stylish_fashion/features/authentication/screens/onboardingscreen/widgets/onboardingpage.dart";
import "package:stylish_fashion/features/authentication/screens/onboardingscreen/widgets/onboardingskip.dart";

import "../../../../utils/constants/image_string.dart";
import "../../../../utils/constants/text_string.dart";
import "../../controllers/onboarding_controller.dart";



class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({super.key});
final controller=Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          PageView(
            controller:controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
            onBoardingPage(
              image: SImages.onboardingimage1,
              title: STexts.onBoardingTitle1,
              subtitle: STexts.onBoardingSubTitle1,
            ),
            onBoardingPage(
              image: SImages.onboardingimage2,
              title: STexts.onBoardingTitle2,
              subtitle: STexts.onBoardingSubTitle2,
            ),
            onBoardingPage(
              image: SImages.onboardingimage3,
              title: STexts.onBoardingTitle3,
              subtitle: STexts.onBoardingSubTitle3,
            ),
      ],),
            const onboardingskip(),
            onboardingnavigation(),
            onboardingnextbutton(),



        ],
      )
    );
  }
}





