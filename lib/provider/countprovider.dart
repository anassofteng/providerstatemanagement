import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
  int _count = 1;
  int get count => _count;
  void setCount() {
    _count++;
    notifyListeners();
  }
}
