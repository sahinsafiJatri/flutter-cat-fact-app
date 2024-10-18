import 'package:flutter/material.dart';

import 'colors.dart';

class CatAppBarTheme {
  CatAppBarTheme._();

  static AppBarTheme lightAppBarTheme = const AppBarTheme(
    backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary
  );

  static AppBarTheme darkAppBarTheme = const AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.onPrimaryDark
  );
}