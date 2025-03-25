import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_front/components/input/text/cit_username.dart';
import 'package:tm_front/utils/u_error_msgs.dart';

void main() {
  group('CITUsername - Validações', () {
    testWidgets(
        'CITUsername-TST1: Mostrar erro de username vazio ao enviar form',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CITUsername(
                controller: controller,
                formSubmitted:
                    true), // Assumindo que o widget que usa cit_username faz sua invocação com esses mesmos valores
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text(ErrorMsgs.usernameEmpty), findsOneWidget);
    });

    testWidgets(
        'CITUsername-TST2: Não mostrar erro de username vazio sem enviar o form',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CITUsername(
                controller: controller,
                formSubmitted:
                    false), // Simulando que o form ainda não foi submetido.
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text(ErrorMsgs.usernameEmpty), findsNothing);
    });

    testWidgets(
        'CITUsername-TST3: Não mostrar erro de username vazio com campo preenchido',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CITUsername(controller: controller, formSubmitted: true),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'a');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text(ErrorMsgs.usernameEmpty), findsNothing);
    });

    testWidgets(
        'CITUsername-TST4: Não mostrar erro de username vazio ao perder o foco no text field',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                CITUsername(
                    controller: controller,
                    formSubmitted:
                        false), //Simulando uma invocação do CITUsername sem submissão de seu form.
                TextFormField(key: const Key('other-field')),
              ],
            ),
          ),
        ),
      );

      // Garante que o widget CITUsername está na tela
      expect(find.byType(CITUsername), findsOneWidget);

      // Foca no text field e depois muda o foco para outro campo
      await tester.tap(find.byType(TextFormField).first);
      await tester.pump();
      await tester.tap(find.byKey(const Key('other-field')));
      await tester.pumpAndSettle();

      expect(find.text(ErrorMsgs.usernameEmpty), findsNothing);
    });

    testWidgets(
        'CITUsername-TST5: Mostrar erro de tamanho ao perder o foco e ao enviar form (username muito curto)',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                CITUsername(controller: controller, formSubmitted: true),
                TextFormField(key: const Key('other-field')),
              ],
            ),
          ),
        ),
      );

      // Digita um username com tamanho inválido (menos de 3 caracteres)
      await tester.enterText(find.byType(TextFormField).first, 'ab');

      // Simula perda de foco
      await tester.tap(find.byKey(const Key('other-field')));
      await tester.pumpAndSettle();

      expect(find.text(ErrorMsgs.usernameLength), findsOneWidget);

      // Agora simula o envio do form (submissão)
      await tester.enterText(find.byType(TextFormField).first, 'ab');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text(ErrorMsgs.usernameLength), findsOneWidget);

      // Teste do teste. Verifica se o status do componente está realmente resetando como esperado. Isto é, verifica que as mensagens de erro emitidas anteriormente somem quando um valor correto é adicionado.
      await tester.enterText(find.byType(TextFormField).first, 'abc');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text(ErrorMsgs.usernameLength), findsNothing);
    });

    testWidgets(
        'CITUsername-TST6: Não mostrar erro de tamanho indevidamente para username válido',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CITUsername(controller: controller, formSubmitted: true),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'abc');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text(ErrorMsgs.usernameLength), findsNothing);
    });

    testWidgets(
        'CITUsername-TST7: Mostrar erro de formato ao perder o foco e ao enviar form (username com caracteres inválidos)',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                CITUsername(controller: controller, formSubmitted: true),
                TextFormField(key: const Key('other-field')),
              ],
            ),
          ),
        ),
      );

      // Digita um username com formato inválido (ex: contém "!" que não é permitido)
      await tester.enterText(find.byType(TextFormField).first, 'abc!');

      // Simula perda de foco
      await tester.tap(find.byKey(const Key('other-field')));
      await tester.pumpAndSettle();

      expect(find.text(ErrorMsgs.usernameInvalid), findsOneWidget);

      // Agora simula o envio do form (submissão)
      await tester.enterText(find.byType(TextFormField).first, 'abc!');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text(ErrorMsgs.usernameInvalid), findsOneWidget);
    });

    testWidgets(
        'CITUsername-TST8: Não mostrar erro de formato indevidamente para username com formato válido',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CITUsername(controller: controller, formSubmitted: true),
          ),
        ),
      );

      // Digita um username com formato válido (exemplo: pode conter ponto e underscore de forma válida)
      await tester.enterText(find.byType(TextFormField), 'usuario.valido');

      // Simula perda de foco
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pump();

      expect(find.text(ErrorMsgs.usernameInvalid), findsNothing);

      // Simula envio do form
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text(ErrorMsgs.usernameInvalid), findsNothing);
    });

    testWidgets(
        'CITUsername-TST9: Mostrar erro de username repetido ao perder o foco e ao enviar form (tela de cadastro)',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      // Para simular a tela de cadastro, usamos formSubmitted true.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                CITUsername(controller: controller, formSubmitted: true),
                TextFormField(key: const Key('other-field')),
              ],
            ),
          ),
        ),
      );

      // Digita o username que já existe
      await tester.enterText(
          find.byType(TextFormField).first, CITUsername.registeredUsername);

      // Simula perda de foco
      await tester.tap(find.byKey(const Key('other-field')));
      await tester.pumpAndSettle();

      expect(find.text(ErrorMsgs.usernameTaken), findsOneWidget);

      // Agora simula o envio do form (submissão)
      await tester.enterText(
          find.byType(TextFormField).first, CITUsername.registeredUsername);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text(ErrorMsgs.usernameTaken), findsOneWidget);
    });
  });
}
