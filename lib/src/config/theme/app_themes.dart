import 'package:flutter/material.dart';
import 'package:movie_characters_app/src/config/theme/app_colors.dart';

final ThemeData appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.appBarBackground,
    foregroundColor: AppColors.textColor,
  ),
  scaffoldBackgroundColor: AppColors.backgroundColor,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.accentColor),
  useMaterial3: true,
);
