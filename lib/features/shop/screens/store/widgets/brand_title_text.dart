import 'package:flutter/material.dart';

import '../../../../../utils/constants/enum.dart';
class SBrandTitleText extends StatelessWidget {
  const SBrandTitleText({super.key, this.color,
    this.maxLines=1, this.textAlign=TextAlign.center,  this.brandTitlesize=TextSizes.small, required this.title});
final Color?color;
final String title;
final int maxLines;
final TextAlign ? textAlign;
final TextSizes brandTitlesize;
  @override
  Widget build(BuildContext context) {
    return Text(title,textAlign: textAlign,overflow:TextOverflow.ellipsis ,
    style: brandTitlesize==TextSizes.small?Theme.of(context).textTheme.labelMedium!.apply(color: color)
    :brandTitlesize==TextSizes.medium
        ?Theme.of(context).textTheme.bodyLarge!.apply(color: color)
        :brandTitlesize==TextSizes.large
    ?Theme.of(context).textTheme.titleLarge!.apply(color: color)
    :Theme.of(context).textTheme.bodyMedium!.apply(color: color)
    );
  }
}
