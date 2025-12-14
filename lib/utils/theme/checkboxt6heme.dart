import 'package:flutter/material.dart';
class SCheckboxTheme{
  SCheckboxTheme._();
  static CheckboxThemeData lightCheckboxTheme=CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4)
    ),
  );
  static CheckboxThemeData darkCheckboxTheme=CheckboxThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4)
    ),
  );


}