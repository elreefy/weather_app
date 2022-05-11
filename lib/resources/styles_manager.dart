import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle({
  required double fontSize,
  required String fontFamily,
  required FontWeight fontWeight,
  required Color color,
}) =>
    TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight,
    );

TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) =>
    _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstant.fontFamily,
      fontWeight: FontWeightManager.regular,
      color: color,
    );

TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) =>
    _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstant.fontFamily,
      fontWeight: FontWeightManager.light,
      color: color,
    );

TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) =>
    _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstant.fontFamily,
      fontWeight: FontWeightManager.medium,
      color: color,
    );

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) =>
    _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstant.fontFamily,
      fontWeight: FontWeightManager.semiBold,
      color: color,
    );

TextStyle getBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) =>
    _getTextStyle(
      fontSize: fontSize,
      fontFamily: FontConstant.fontFamily,
      fontWeight: FontWeightManager.bold,
      color: color,
    );
