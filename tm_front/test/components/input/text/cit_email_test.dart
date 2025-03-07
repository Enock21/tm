import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/components/c_error_msgs.dart';

void main() {
  group('CITEmail - Validações Diretas', () {
    test('Erro quando o campo de e-mail está vazio', () {
      final emailField = CITEmail(controller: TextEditingController());
      final validator = emailField.validator!;

      expect(validator(null), CErrorMsgs.emailEmpty);
      expect(validator(''), CErrorMsgs.emailEmpty);
    });

    test('Erro de formato de e-mail inválido', () {
      final emailField = CITEmail(controller: TextEditingController());
      final validator = emailField.validator!;

      expect(validator('email_invalido'), CErrorMsgs.emailInvalid);
    });

    test('Erro de email já cadastrado na tela de cadastro', () {
      final emailField = CITEmail(controller: TextEditingController(), isRegisterScreen: true);
      final validator = emailField.validator!;

      expect(validator(CITEmail.registeredEmail), CErrorMsgs.emailTaken);
    });

    test('Não exibe erro para e-mail válido', () {
      final emailField = CITEmail(controller: TextEditingController());
      final validator = emailField.validator!;

      expect(validator('email@valido.com'), null);
    });
  });
}
