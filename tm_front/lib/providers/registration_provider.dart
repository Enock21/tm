import 'package:flutter/material.dart';
import '../models/registration_data.dart';

class RegistrationProvider extends ChangeNotifier {
  RegistrationData _data = RegistrationData();

  RegistrationData get data => _data;

  void updateBasicInfo({String? username, String? email, DateTime? birthdate, String? password}) {
    _data.username = username;
    _data.email = email;
    _data.birthdate = birthdate;
    _data.password = password;
    notifyListeners();
  }

  void setPlayerChoice(bool isPlayer) {
    _data.isPlayer = isPlayer;
    notifyListeners();
  }

  void setGMChoice(bool isGM) {
    _data.isGM = isGM;
    notifyListeners();
  }

  // Outros métodos para atualizar os dados conforme o fluxo
  // ...
}
