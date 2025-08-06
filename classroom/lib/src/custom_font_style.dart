import 'package:flutter/material.dart';
import 'package:classroom/src/theme.dart';

class CustomFontStyle {
  CustomFontStyle();

  final TextStyle textRegular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: CustomColors.secondaryDark,
  );

  final TextStyle textGreenRegular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: CustomColors.primaryDark,
  );

  final TextStyle textTitle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 32,
    fontFamily: 'Oswald',
    color: CustomColors.primaryDark,
  );

  final TextStyle textTitleItalic = const TextStyle(
    fontStyle: FontStyle.italic,
    fontSize: 20,
    fontFamily: 'Oswald',
  );
}
