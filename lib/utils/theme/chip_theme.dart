import 'package:flutter/material.dart';
class SChipTheme{
  SChipTheme._();
  static ChipThemeData lightChipTheme=ChipThemeData(
 disabledColor: Colors.grey,
    selectedColor: Colors.blue,
    labelStyle: TextStyle(color: Colors.black),
    checkmarkColor: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
  );

  static ChipThemeData darkChipTheme=ChipThemeData(
    disabledColor: Colors.grey,
    selectedColor: Colors.blue,
    labelStyle: TextStyle(color: Colors.white),
    checkmarkColor: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
  );


}