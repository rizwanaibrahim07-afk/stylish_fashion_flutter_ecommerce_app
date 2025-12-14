import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helperfunctions.dart';
class STabbar extends StatelessWidget implements PreferredSizeWidget {
  const STabbar({
    super.key, required this.tabs,

  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark=SHelperFunctions.isDarkMode(context);
    return Material(
      color: dark?SColors.black:SColors.white,
      child: TabBar(
        isScrollable:true,
        indicatorColor:SColors.primary,
        labelColor: dark?SColors.white:SColors.primary,
        unselectedLabelColor: SColors.darkerGrey,
        tabs:tabs,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
