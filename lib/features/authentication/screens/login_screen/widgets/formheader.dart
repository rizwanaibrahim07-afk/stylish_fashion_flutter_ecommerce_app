import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    this.imageColor,
    this.heightBetween,
    this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.30,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start, required this.title1,
  });

  //Variables -- Declared in Constructor
  final Color? imageColor;
  final double ?imageHeight;
  final double? heightBetween;
  final String? image;
  final String title1, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(title1, style: TextStyle(color: Colors.purple,fontSize: 50)),
        SizedBox(height: heightBetween),
        Text(title, style: Theme.of(context).textTheme.displayLarge),
        Text(subTitle, textAlign: textAlign, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}