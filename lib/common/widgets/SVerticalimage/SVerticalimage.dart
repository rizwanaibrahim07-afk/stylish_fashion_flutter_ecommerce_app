import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helpers/helperfunctions.dart';
class SverticalimageText extends StatelessWidget {
  const SverticalimageText({
    super.key, required this.image, required this.title,
    this.textColor=SColors.white, this.backgroundcolor, this.onTap,
  });

  final String image,title;
  final Color textColor;
  final Color? backgroundcolor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(SSizes.spaceBtwItem/4),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: backgroundcolor??(SHelperFunctions.isDarkMode(context)?SColors.black:SColors.white),
                borderRadius:BorderRadius.circular(100),
              ),clipBehavior: Clip.antiAlias,
              child: Padding(padding: EdgeInsets.all(4),child:Center(
                child: Image(image:NetworkImage(image),
                    fit: BoxFit.cover,filterQuality: FilterQuality.high),
              ),),
            ),
            SizedBox(height:SSizes.spaceBtwItem/2),
            SizedBox(height:53,
              child: Text(title,style: Theme.of(context).textTheme.labelMedium,maxLines: 1,
                overflow: TextOverflow.ellipsis, ),
            )
          ],
        ),
      ),
    );
  }
}
