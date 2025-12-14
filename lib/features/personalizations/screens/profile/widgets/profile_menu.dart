import 'package:flutter/material.dart';

import '../../../../../utils/constants/size.dart';
class Profilemenu extends StatelessWidget {
  const Profilemenu({
    super.key, required this.icon, required this.onPressed, required this.title, required this.value,
  });
final IconData icon;
final VoidCallback onPressed;
final String title,value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: SSizes.spaceBtwItem/2),
        child: Row(
          children: [
            Expanded(flex:3,child: Text(title,
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,maxLines: 1,)),
            Expanded(flex:5,child: Text(value,style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,maxLines: 1, )),
            Expanded(child: Icon(icon,size: 23,),)
          ],
        ),
      ),
    );
  }
}