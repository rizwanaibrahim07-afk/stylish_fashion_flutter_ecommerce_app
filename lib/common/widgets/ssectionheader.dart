import 'package:flutter/material.dart';
class SSectionHeader extends StatelessWidget {
  const SSectionHeader({
    super.key, this.textColor,  this.actionButton=true, required this.title,
    this.buttonTitle='View all', this.onPressed,
  });
  final Color? textColor;
  final bool actionButton;
  final String title,buttonTitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor),maxLines: 1,overflow: TextOverflow.ellipsis,),
        if(actionButton)TextButton(onPressed: onPressed, child:Text(buttonTitle))
      ],
    );
  }
}
