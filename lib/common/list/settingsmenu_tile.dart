import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({super.key, required this.icon, required this.title, required this.subTitle, this.trailing, this.ontap});
final IconData icon;
final String title;
final String subTitle;
final Widget? trailing;
final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,size: 28,color: SColors.primary,),
      title: Text(title,style: Theme.of(context).textTheme.titleSmall,),
      subtitle: Text(subTitle,style: Theme.of(context).textTheme.labelSmall,),
      trailing: trailing,
      onTap: ontap,
    );
  }
}
