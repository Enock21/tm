import 'package:flutter/foundation.dart';

class UserProfileState with ChangeNotifier {
  late bool _isPlayer;
  late bool _isGM;

  bool get isPlayer => _isPlayer;
  bool get isGM => _isGM;

  void setPlayerChoice(bool choice) {
    _isPlayer = choice;
    notifyListeners();
  }

  void setGMChoice(bool choice) {
    _isGM = choice;
    notifyListeners();
  }
}
