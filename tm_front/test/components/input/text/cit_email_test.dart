import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/components/c_error_msgs.dart';

void main() {
  group('CITEmail - Validações', () {
    test('Erro quando o campo de e-mail está vazio', () {
      final emailField = CITEmail(controller: TextEditingController());
      final validator = emailField.validator;

      expect(validator(null), CErrorMsgs.emailEmpty);
      expect(validator(''), CErrorMsgs.emailEmpty);
    });

    test('Erro de formato de e-mail inválido', () {
      final emailField = CITEmail(controller: TextEditingController());
      final validator = emailField.validator;

      expect(validator('email_invalido'), CErrorMsgs.emailInvalid);
    });

    test('Erro de email já cadastrado na tela de cadastro', () {
      final emailField =
          CITEmail(controller: TextEditingController(), isRegisterScreen: true);
      final validator = emailField.validator;

      expect(validator(CITEmail.registeredEmail), CErrorMsgs.emailTaken);
    });

    test('Não exibe erro para e-mail válido', () {
      final emailField = CITEmail(controller: TextEditingController());
      final validator = emailField.validator;

      expect(validator('email@valido.com'), null);
    });

    testWidgets('Erro de formato de e-mail inválido ao perder o foco',
        (WidgetTester tester) async {
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

    testWidgets(
        'Não exibe erro de formato de e-mail inválido ao perder o foco com email válido',
        (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITEmail(controller: controller),
        ),
      ));

      await tester.enterText(
          find.byType(TextFormField), CITEmail.registeredEmail);

      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pump();

      // Verifica se a mensagem de erro está visível na tela
      expect(find.text(CErrorMsgs.emailInvalid), findsNothing);
    });

    testWidgets(
        'Erro de email já cadastrado na tela de cadastro ao perder o foco',
        (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITEmail(controller: controller, isRegisterScreen: true),
        ),
      ));

      //Digitando email já cadastrado
      await tester.enterText(
          find.byType(TextFormField), CITEmail.registeredEmail);

      // Simula a perda de foco
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pump();

      // Verifica se a mensagem de erro "email já cadastrado" aparece na tela
      expect(find.text(CErrorMsgs.emailTaken), findsOneWidget);
    });

    //Não era pra dar certo. O teste manual contradiz esse teste automático.
    testWidgets('Erro de campo vazio não aparece ao perder o foco',
        (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITEmail(controller: controller),
        ),
      ));

      // Simula a perda de foco
      FocusManager.instance.primaryFocus?.unfocus();

      //expect(FocusManager.instance.primaryFocus, isNull);  // Verifica se o foco foi removido. Se der ruim, significa que o foco nao foi removido.

      await tester.pump();

      expect(find.text(CErrorMsgs.emailEmpty), findsNothing);
    });

    //Test debugger. Se for bem sucedido, o comportamento do teste automatico é igual o do teste manual.
    testWidgets('Erro de campo vazio não aparece ao perder o foco debugger',
        (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              CITEmail(controller: controller),
              SizedBox(height: 20), // Espaço para evitar sobreposição
              Text('Outro Widget'), // Um widget para tocar e remover o foco
            ],
          ),
        ),
      ));

      print('TESTEEEEEEEEEEEEEEEEEEEE');

      // Garante que o campo de e-mail foi renderizado
      expect(find.byType(TextFormField), findsOneWidget);

      // Simula a entrada e saída do campo de e-mail
      await tester.tap(find.byType(TextFormField));
      await tester.pump();
      await tester.tap(find.text('Outro Widget')); // Toque fora do campo
      await tester.pumpAndSettle();

      expect(FocusManager.instance.primaryFocus, isNull);  // Verifica se o foco foi removido
      // Verifica se a mensagem de erro "campo vazio" apareceu na tela
      expect(find.text(CErrorMsgs.emailEmpty), findsOneWidget);
    });
  });
}
