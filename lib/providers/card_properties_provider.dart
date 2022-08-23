import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CardProperties extends ChangeNotifier {
  Color _cardColor = Colors.orange;

  Color get cardColor => _cardColor;

  set changeCardColor(Color color) {
    _cardColor = color;
    notifyListeners();
  }

  double _height = 100.0;
  double get height => _height;

  set changeCardHeight(double height) {
    _height = height;
    notifyListeners();
  }
}
