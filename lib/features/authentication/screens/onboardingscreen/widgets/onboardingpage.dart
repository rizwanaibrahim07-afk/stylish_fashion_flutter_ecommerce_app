import 'package:flutter/material.dart';

import '../../../../../utils/constants/size.dart';
class onBoardingPage extends StatelessWidget {
  const onBoardingPage({
    super.key, required this.image, required this.title, required this.subtitle,
  });
  final String image,title,subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
          children: [
            Image(width:MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height*0.4,
                image:  AssetImage(image)),
            Text(title,
              style: Theme.of(context).textTheme.headlineMedium
              ,textAlign: TextAlign.center,),
            const SizedBox(height:SSizes.spaceBtwItem),
            Text(subtitle,style:
            Theme.of(context).textTheme.headlineSmall,textAlign: TextAlign.center,)]
      ),
    );
  }
}
