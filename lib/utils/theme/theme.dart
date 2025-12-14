import 'package:flutter/material.dart';
import 'package:stylish_fashion/utils/theme/textfield.dart';
import 'package:stylish_fashion/utils/theme/texttheme.dart';


import 'appbartheme.dart';
import 'bottomsheettheme.dart';
import 'checkboxt6heme.dart';
import 'elevatedbuttontheme.dart';

class SAppTheme{
  SAppTheme._();
  static ThemeData lightTheme=ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor:Colors.white,
    textTheme:STextTheme.lightTextTheme,
    elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: SAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: SBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: SCheckboxTheme.lightCheckboxTheme,
    inputDecorationTheme: STextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme=ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor:Colors.black,
    textTheme:STextTheme.darkTextTheme,
    elevatedButtonTheme: SElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: SAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: SBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: SCheckboxTheme.darkCheckboxTheme,
    inputDecorationTheme: STextFormFieldTheme.darkInputDecorationTheme,
  );
}