import 'package:flutter/material.dart';

class Counter1 extends ChangeNotifier {
  int _counter = 1;
  void increment() {
    _counter++;
    notifyListeners();
  }

  int get getCounter => _counter;
  set setCounter(int num) {
    _counter = num;
    notifyListeners();
  }
}
