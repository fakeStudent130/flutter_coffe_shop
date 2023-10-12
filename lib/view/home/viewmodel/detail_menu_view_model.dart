import 'package:flutter/material.dart';

import '../../../utils/theme/my_color.dart';

class DetailMenuViewModel extends ChangeNotifier {
  bool _isFavorite = false;

  bool get isFavorite => _isFavorite;

  Color get iconColor {
    return _isFavorite ? kRed : kBlack;
  }

  void changeFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }
}
