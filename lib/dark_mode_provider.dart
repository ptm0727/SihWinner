import 'package:flutter/cupertino.dart';

class DarkMode extends ChangeNotifier {
  bool _darkMode = false;
  bool get dark => _darkMode;
  set dark(bool val) {
    _darkMode = val;
    notifyListeners();
  }
}
