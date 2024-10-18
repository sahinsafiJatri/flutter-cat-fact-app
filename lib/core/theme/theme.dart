import 'package:flutter/material.dart';
import 'package:flutter_cat_fact_app/core/theme/app_bar_theme.dart';
import 'package:flutter_cat_fact_app/core/theme/card_theme.dart';
import 'package:flutter_cat_fact_app/core/theme/text_theme.dart';

// final _client = http.Client();
// final _baseUrls = "www.jsonkeeper.com";
//
// Future<http.Response> fetchCatFactsApi() {
//   return _client.get(Uri.https(_baseUrls, "b/LFSH"));
// }

class CatAppTheme {
  CatAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: CatAppBarTheme.lightAppBarTheme,
    scaffoldBackgroundColor: Colors.white,
    cardTheme: CatCardTheme.lightTheme,
    textTheme: CatTextTheme.lightTheme
  );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      appBarTheme: CatAppBarTheme.darkAppBarTheme,
      scaffoldBackgroundColor: Colors.black,
      cardTheme: CatCardTheme.darkTheme,
      textTheme: CatTextTheme.darkTheme
  );
}