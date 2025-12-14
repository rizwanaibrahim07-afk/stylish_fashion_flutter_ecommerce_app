import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_string.dart';
import '../../../../../utils/constants/size.dart';
import '../../../controllers/logincontroller.dart';

class SocialFooter extends StatelessWidget {
  const SocialFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: SColors.grey),
          ),
          child: IconButton(onPressed: () {},
              icon: const Image(image: AssetImage(SImages.facebook),
                width: SSizes.xl, height: SSizes.xl,)),
        ),

        Container(
          decoration: BoxDecoration(
            border: Border.all(color: SColors.grey),
          ),
          child: IconButton(onPressed: () {
            LoginController.instance.signInWithGoogle();
          },
              icon: const Image(image: AssetImage(SImages.google),
                width: SSizes.xl, height: SSizes.xl,)),
        )
      ],);
  }
}

