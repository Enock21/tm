import 'package:flutter/foundation.dart';

class PRegistrationData with ChangeNotifier {
  //COMO ISSO FUNCIONA SEM UM BUILD??? ESSE WIDGET NÃO É RECONSTRUÍDO QUANDO ATUALIZA?
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
