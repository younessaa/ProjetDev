import 'package:flutter/material.dart';
import 'constants.dart';


ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor : kPrimaryColor,
      iconTheme: IconThemeData(color: kIconColorU),
    ),
  );
}
