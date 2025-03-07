import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/components/c_error_msgs.dart';

void main() {
  group('CITEmail - Validações', () {
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
      final validator = emailField.validator;

      expect(validator(CITEmail.registeredEmail), CErrorMsgs.emailTaken);
    });

    test('Não exibe erro para e-mail válido', () {
      final emailField = CITEmail(controller: TextEditingController());
      final validator = emailField.validator!;

      expect(validator('email@valido.com'), null);
    });

    testWidgets('Erro de formato de e-mail inválido ao perder o foco', (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITEmail(controller: controller),
        ),
      ));

      // Digita um e-mail inválido
      await tester.enterText(find.byType(TextFormField), 'email_invalido');
      
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pump();

      // Verifica se a mensagem de erro está visível na tela
      expect(find.text(CErrorMsgs.emailInvalid), findsOneWidget);
    });

    testWidgets('Não exibe erro de formato de e-mail inválido ao perder o foco com email válido', (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITEmail(controller: controller),
        ),
      ));

      // Digita um e-mail inválido
      await tester.enterText(find.byType(TextFormField), 'email@valido.com');
      
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pump();

      // Verifica se a mensagem de erro está visível na tela
      expect(find.text(CErrorMsgs.emailInvalid), findsNothing);
    });

    testWidgets('Erro de email já cadastrado na tela de cadastro ao perder o foco', (WidgetTester tester) async {
      final controller = TextEditingController(text: CITEmail.registeredEmail);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITEmail(controller: controller, isRegisterScreen: true),
        ),
      ));

      //Digitando email já cadastrado
      await tester.enterText(find.byType(TextFormField), 'email@existente.com');

      // Simula a perda de foco
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pump();

      // Verifica se a mensagem de erro "email já cadastrado" aparece na tela
      expect(find.text(CErrorMsgs.emailTaken), findsOneWidget);
    });

  });
}
