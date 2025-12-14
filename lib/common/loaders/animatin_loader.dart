import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/size.dart';

class SAnimationLoader extends StatelessWidget {
  const SAnimationLoader({
    super.key,
    required this.text,
    required this.animation,
    this.showAction=false,
    this.actionText,
    this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image:AssetImage(animation),width: MediaQuery.of(context).size.width*0.8),
          const SizedBox(height: SSizes.defaultSpace,),
          Text(text,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
          const SizedBox(height: SSizes.defaultSpace,),
          showAction?
              SizedBox(width: 250,
              child: OutlinedButton(onPressed: onActionPressed,
                  child: Text(
                    actionText!,style: Theme.of(context).textTheme.bodyMedium!.apply(color: SColors.light),
                  ),),
              )
          :SizedBox(),
        ],
      ),
    );
  }
}
