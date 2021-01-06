import 'package:chatter_box/utils/constants.dart';
import 'package:chatter_box/utils/enums.dart';
import 'package:flutter/material.dart';

final appThemeData = {
  AppTheme.BlueLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.kPrimaryColor,
  ),
  AppTheme.BlueDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.kPrimaryColor,
  ),
  AppTheme.GreenLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.kAccentShade,
  ),
  AppTheme.GreenDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.kAccentShade,
  ),
};
