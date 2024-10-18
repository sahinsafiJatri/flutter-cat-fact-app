import 'package:flutter/material.dart';
import 'package:flutter_cat_fact_app/core/theme/colors.dart';

class CatCardTheme {
  CatCardTheme._();

  static CardTheme lightTheme = const CardTheme(
      color: AppColors.surface,
      surfaceTintColor: AppColors.onSurface
  );

  static CardTheme darkTheme = const CardTheme(
      color: AppColors.surfaceDark,
      surfaceTintColor: AppColors.onSurfaceDark
  );
}
