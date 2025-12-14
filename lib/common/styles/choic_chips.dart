import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/helpers/helperfunctions.dart';
import '../widgets/custom_shapes/containers/circularcontainer.dart';
class SChoiceChip extends StatelessWidget {
  const SChoiceChip({super.key, required this.text, required this.selected ,this.onSelected});
 final String text;
 final bool selected;
 final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final isColor=SHelperFunctions.getColor(text)!=null;
    return ChoiceChip(label:SHelperFunctions.getColor(text) !=null ? const SizedBox(): Text(text),
        selected: selected,
  onSelected: onSelected,
  labelStyle: TextStyle(color: selected?SColors.white:null),
  avatar: SHelperFunctions.getColor(text)!=null
  ?SCircularContainer(width: 50,height: 50,backgroundcolor: SHelperFunctions.getColor(text)!)
  :null,shape:isColor? CircleBorder():null,labelPadding: EdgeInsets.all(0),
  padding:EdgeInsets.all(0),
      selectedColor: SColors.primary,
      backgroundColor:isColor?SHelperFunctions.getColor(text)!:null ,);

  }
}
