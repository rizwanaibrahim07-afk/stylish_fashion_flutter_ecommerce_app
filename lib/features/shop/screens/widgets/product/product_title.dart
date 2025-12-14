import 'package:flutter/material.dart';
class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text,style: Theme.of(context).textTheme.labelMedium,
          overflow: TextOverflow.ellipsis,maxLines: 2,textAlign: TextAlign.left,),
        SizedBox(height: 2),

      ],
    );
  }
}

