import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/utils/u_error_msgs.dart';

void main() {
  group('CITEmail - Validações', () {
    testWidgets(
        'CITEmail-TST1: Erro de formato de email inválido é ativado ao perder o foco',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      // formSubmitted false para não acionar o erro de email vazio ao perder o foco
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                CITEmail(
                  controller: controller,
                  formSubmitted: false,
                ),
                // Campo auxiliar para forçar a perda de foco
                TextFormField(key: const Key('dummy')),
              ],
            ),
          ),
        ),
      );

      // Digita um email com formato inválido
      await tester.enterText(
          find.byType(TextFormField).first, 'email_invalido');

      // Simula perda de foco ao tocar no campo auxiliar
      await tester.tap(find.byKey(const Key('dummy')));
      await tester.pumpAndSettle();

      // Verifica se o erro de formato é exibido
      expect(find.text(CErrorMsgs.emailInvalid), findsOneWidget);
    });

    testWidgets(
        'CITEmail-TST2: Erro de formato de email inválido é ativado ao enviar form',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      // formSubmitted true para simular tentativa de envio do formulário
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CITEmail(
              controller: controller,
              formSubmitted: true,
            ),
          ),
        ),
      );

      // Digita um email com formato inválido
      await tester.enterText(
          find.byType(TextFormField), 'email_invalido');

      // Simula a ação de envio do formulário
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // Verifica se o erro de formato é exibido
      expect(find.text(CErrorMsgs.emailInvalid), findsOneWidget);
    });

    testWidgets(
        'CITEmail-TST3: Erro de email já cadastrado na tela de cadastro ocorre ao perder o foco',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                CITEmail(
                  controller: controller,
                  formSubmitted: true,
                  isRegisterScreen: true,
                ),
                // Campo auxiliar para forçar a perda de foco
                TextFormField(key: const Key('dummy')),
              ],
            ),
          ),
        ),
      );

      // Digita o email já cadastrado
      await tester.enterText(
          find.byType(TextFormField).first, CITEmail.registeredEmail);

      // Simula a perda de foco ao tocar no campo auxiliar
      await tester.tap(find.byKey(const Key('dummy')));
      await tester.pumpAndSettle();

      // Verifica se o erro de email já cadastrado é exibido
      expect(find.text(CErrorMsgs.emailTaken), findsOneWidget);
    });

    testWidgets(
        'CITEmail-TST4: Erro de email já cadastrado na tela de cadastro ocorre ao enviar form',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CITEmail(
              controller: controller,
              formSubmitted: true,
              isRegisterScreen: true,
            ),
          ),
        ),
      );

      // Digita o email já cadastrado
      await tester.enterText(
          find.byType(TextFormField), CITEmail.registeredEmail);

      // Simula a ação de envio do formulário
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // Verifica se o erro de email já cadastrado é exibido
      expect(find.text(CErrorMsgs.emailTaken), findsOneWidget);
    });

    testWidgets(
        'CITEmail-TST5: Erro de falta de email não aparece ao perder o foco',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      // formSubmitted false para que o erro de email vazio não seja disparado ao perder o foco
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                CITEmail(
                  controller: controller,
                  formSubmitted: false,
                ),
                // Campo auxiliar para forçar a perda de foco
                TextFormField(key: const Key('dummy')),
              ],
            ),
          ),
        ),
      );

      // Deixa o campo vazio e simula a perda de foco
      await tester.tap(find.byType(TextFormField).first);
      await tester.pump();
      await tester.tap(find.byKey(const Key('dummy')));
      await tester.pumpAndSettle();

      // Verifica que o erro de falta de email não é exibido
      expect(find.text(CErrorMsgs.emailEmpty), findsNothing);
    });

    testWidgets(
        'CITEmail-TST6: Erro de falta de email é ativado ao enviar form com campo vazio',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      // formSubmitted true para que a tentativa de envio dispare a validação de campo vazio
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CITEmail(
              controller: controller,
              formSubmitted: true,
            ),
          ),
        ),
      );

      // Deixa o campo vazio e simula o envio do formulário
      await tester.enterText(find.byType(TextFormField), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      // Verifica se o erro de falta de email é exibido
      expect(find.text(CErrorMsgs.emailEmpty), findsOneWidget);
    });
  });
}
