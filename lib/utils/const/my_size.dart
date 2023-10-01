import 'package:flutter/material.dart';

class MySize {
  static const double screenPadding = 30;

  //mengembalikan lebar layar
  double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  ///mengembalikan tinggi layar
  double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  ///mengembalikan lebar body yang ada paddingnya (30)
  double bodyWidth(BuildContext context) {
    return MediaQuery.of(context).size.width - (screenPadding * 2);
  }

  ///mengembalikan setengah dari lebar body yang ada paddingnya (30)
  double bodyHalfWidth(BuildContext context) {
    return (MediaQuery.of(context).size.width - (screenPadding * 2)) / 2;
  }
}
