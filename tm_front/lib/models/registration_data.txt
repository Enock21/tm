class RegistrationData {
  String? username;
  String? email;
  DateTime? birthdate;
  String? password;
  bool? isPlayer; // true se o usuário escolheu perfil de jogador em SRP1Choice
  bool? isGM;     // true se o usuário escolheu perfil de GM em SRGM1Choice

  // Outros campos opcionais conforme o fluxo
}
