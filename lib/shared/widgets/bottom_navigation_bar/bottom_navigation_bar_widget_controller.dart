import 'package:flutter/cupertino.dart';

class BottomNavigationBarWidgetController extends ChangeNotifier {
  int buttonSelected = 0;

  void handleButtonSelected(int indexOfButton) {
    buttonSelected = indexOfButton;

    notifyListeners();
  }
}
