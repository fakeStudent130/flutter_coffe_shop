import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/utils/theme/my_color.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleTheme {
  static ThemeData themeData() {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.brown,
      primaryColor: kBrown,
      fontFamily: GoogleFonts.sora().fontFamily,
      textTheme: GoogleFonts.soraTextTheme().copyWith(),
      scaffoldBackgroundColor: kWhite,
    );
  }
}
