
import 'package:flutter/material.dart';
import 'package:flutter_cat_fact_app/core/theme/colors.dart';

class CatTextTheme {
  CatTextTheme._();

  static TextTheme lightTheme = TextTheme(
    titleLarge: const TextStyle().copyWith(fontSize: 22, color: AppColors.onSurface, fontWeight: FontWeight.w500),
    bodyLarge: const TextStyle().copyWith(fontSize: 16, color: AppColors.onSurface, fontWeight: FontWeight.normal),
    bodyMedium: const TextStyle().copyWith(fontSize: 14, color: AppColors.onSurface, fontWeight: FontWeight.normal),
    bodySmall: const TextStyle().copyWith(fontSize: 12, color: AppColors.onSurface, fontWeight: FontWeight.normal),
  );

  static TextTheme darkTheme = TextTheme(
    titleLarge: const TextStyle().copyWith(fontSize: 22, color: AppColors.onSurfaceDark, fontWeight: FontWeight.w500),
    bodyLarge: const TextStyle().copyWith(fontSize: 16, color: AppColors.onSurfaceDark, fontWeight: FontWeight.normal),
    bodyMedium: const TextStyle().copyWith(fontSize: 14, color: AppColors.onSurfaceDark, fontWeight: FontWeight.normal),
    bodySmall: const TextStyle().copyWith(fontSize: 12, color: AppColors.onSecondaryDark, fontWeight: FontWeight.normal),
  );
}