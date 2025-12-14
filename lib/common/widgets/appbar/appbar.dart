import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/size.dart';
import '../../../utils/helpers/helperfunctions.dart';
class SAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SAppbar( {super.key, required this.title,  this.showBackArrow=false, this.leadingIcon,
      this.actions, this.leadingOnPressed});
final Widget ? title;
final bool showBackArrow;
final IconData? leadingIcon;
final List<Widget>? actions;
final VoidCallback? leadingOnPressed;
  @override
  Widget build(BuildContext context) {
    final dark=SHelperFunctions.isDarkMode(context);
    return Padding(padding: const EdgeInsets.symmetric(horizontal: SSizes.md),
    child: AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(onPressed: ()=>Get.back(), icon: Icon(CupertinoIcons.arrow_left),
        color:dark?Colors.white:Colors.black ,)
          : leadingIcon!=null?IconButton(onPressed: ()=>leadingOnPressed, icon:Icon(leadingIcon)):null,
      title: title,
      actions: actions,
    ),);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
