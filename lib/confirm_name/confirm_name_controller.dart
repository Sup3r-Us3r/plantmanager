import 'package:flutter/cupertino.dart';

class ConfirmNameController extends ChangeNotifier {
  String myName = '';
  bool isValid = true;

  void handleSetMyName(String name) {
    myName = name;
  }

  void handleSetIsValidTrue() {
    isValid = true;
    notifyListeners();
  }

  void handleSetIsValidFalse() {
    isValid = false;
    notifyListeners();
  }
}
