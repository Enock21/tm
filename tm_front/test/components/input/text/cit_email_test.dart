import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/components/c_error_msgs.dart';

void main() {
  group('CITEmail - Validações', () {
    testWidgets('Exibe erro quando o campo de e-mail está vazio', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITEmail(controller: controller),
        ),
      ));

      await tester.tap(find.byType(TextFormField));
      await tester.enterText(find.byType(TextFormField), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text(CErrorMsgs.emailEmpty), findsOneWidget);
    });

    testWidgets('Exibe erro quando o formato do e-mail é inválido', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITEmail(controller: controller),
        ),
      ));

      await tester.enterText(find.byType(TextFormField), 'email_invalido');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text(CErrorMsgs.emailInvalid), findsOneWidget);
    });

    testWidgets('Não exibe erro quando o e-mail tem formato válido', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITEmail(controller: controller),
        ),
      ));

      await tester.enterText(find.byType(TextFormField), 'email@valido.com');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text(CErrorMsgs.emailInvalid), findsNothing);
      expect(find.text(CErrorMsgs.emailEmpty), findsNothing);
    });

    testWidgets('Exibe erro quando o e-mail já está cadastrado (somente na tela de cadastro)', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITEmail(controller: controller, isRegisterScreen: true),
        ),
      ));

      await tester.enterText(find.byType(TextFormField), CITEmail.registeredEmail);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text(CErrorMsgs.emailTaken), findsOneWidget);
    });

    testWidgets('Não exibe erro de e-mail já cadastrado na tela de login', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITEmail(controller: controller, isRegisterScreen: false),
        ),
      ));

      await tester.enterText(find.byType(TextFormField), CITEmail.registeredEmail);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text(CErrorMsgs.emailTaken), findsNothing);
    });
  });
}
