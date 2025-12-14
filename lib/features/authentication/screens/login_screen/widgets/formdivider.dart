import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helperfunctions.dart';


class FormDividerWidget extends StatelessWidget {
  const FormDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Flexible(child: Divider(thickness: 1, indent: 50,
        color: Colors.grey.withValues(alpha: 0.3), endIndent: 10)),
        Text('or SignIn With', style: Theme.of(context).textTheme.bodyLarge!.apply(color: dark ? SColors.white : SColors.dark)),
        Flexible(child: Divider(thickness: 1, indent: 10, color: Colors.grey.withValues(alpha: 0.3), endIndent: 50)),
      ],
    );
  }
}