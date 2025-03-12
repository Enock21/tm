import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_front/components/input/text/cit_username.dart';
import 'package:tm_front/components/c_error_msgs.dart';

void main() {
  group('CITUsername - Validações', () {
    //Não mostra o erro no teste manual
    testWidgets(
        'Mostrar erro de username vazio ao enviar form',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      // Aqui simulamos a tela de cadastro (formSubmitted true)
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CITUsername(controller: controller, formSubmitted: true), // Assumindo que o widget que usa cit_username faz a invocação com esses mesmos valores
          ),
        ),
      );

      // Campo vazio e submete (simulando "enter")
      await tester.enterText(find.byType(TextFormField), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text(CErrorMsgs.usernameEmpty), findsOneWidget);
    });

    testWidgets(
        'Não mostrar erro de username vazio sem enviar o form',
        (WidgetTester tester) async {
      final controller = TextEditingController();
      // Aqui simulamos a tela de cadastro (formSubmitted true)
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CITUsername(controller: controller, formSubmitted: false), // Simulando que o form ainda não foi submetido.
          ),
        ),
      );

      // Campo vazio e submete (simulando "enter")
      await tester.enterText(find.byType(TextFormField), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text(CErrorMsgs.usernameEmpty), findsNothing);
    });

    // //Realmente necessário?
    // testWidgets(
    //     'Não mostrar erro de username vazio indevidamente (sem submeter)',
    //     (WidgetTester tester) async {
    //   final controller = TextEditingController();
    //   // Aqui simulamos uma tela que não está em modo de cadastro (formSubmitted false)
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: CITUsername(controller: controller, formSubmitted: false),
    //       ),
    //     ),
    //   );

    //   await tester.enterText(find.byType(TextFormField), '');
    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pump();

    //   expect(find.text(CErrorMsgs.usernameEmpty), findsNothing);
    // });

    // testWidgets(
    //     'Não mostrar erro de username vazio ao perder o foco no text field',
    //     (WidgetTester tester) async {
    //   final controller = TextEditingController();
    //   // Utilizando formSubmitted false para que o erro vazio não seja exibido ao perder o foco
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: Column(
    //           children: [
    //             CITUsername(controller: controller, formSubmitted: false),
    //             TextFormField(key: const Key('other-field')),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );

    //   // Garante que o widget CITUsername está na tela
    //   expect(find.byType(CITUsername), findsOneWidget);

    //   // Foca no text field e depois muda o foco para outro campo
    //   await tester.tap(find.byType(TextFormField).first);
    //   await tester.pump();
    //   await tester.tap(find.byKey(const Key('other-field')));
    //   await tester.pumpAndSettle();

    //   expect(find.text(CErrorMsgs.usernameEmpty), findsNothing);
    // });

    // testWidgets(
    //     'Mostrar erro de tamanho ao perder o foco e ao enviar form (username muito curto)',
    //     (WidgetTester tester) async {
    //   final controller = TextEditingController();
    //   // Utilizamos formSubmitted true para simular o comportamento na tela de cadastro
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: Column(
    //           children: [
    //             CITUsername(controller: controller, formSubmitted: true),
    //             TextFormField(key: const Key('other-field')),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );

    //   // Digita um username com tamanho inválido (menos de 3 caracteres)
    //   await tester.enterText(find.byType(TextFormField).first, 'ab');

    //   // Simula perda de foco
    //   await tester.tap(find.byKey(const Key('other-field')));
    //   await tester.pumpAndSettle();

    //   expect(find.text(CErrorMsgs.usernameLength), findsOneWidget);

    //   // Agora simula o envio do form (submissão)
    //   await tester.enterText(find.byType(TextFormField).first, 'ab');
    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pump();

    //   expect(find.text(CErrorMsgs.usernameLength), findsOneWidget);
    // });

    // testWidgets('Não mostrar erro de tamanho indevidamente para username válido',
    //     (WidgetTester tester) async {
    //   final controller = TextEditingController();
    //   // Mesmo em tela de cadastro (formSubmitted true), se o username tiver tamanho válido não deve exibir erro
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: CITUsername(controller: controller, formSubmitted: true),
    //       ),
    //     ),
    //   );

    //   await tester.enterText(find.byType(TextFormField), 'abc');
    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pump();

    //   expect(find.text(CErrorMsgs.usernameLength), findsNothing);
    // });

    // testWidgets(
    //     'Mostrar erro de formato ao perder o foco e ao enviar form (username com caracteres inválidos)',
    //     (WidgetTester tester) async {
    //   final controller = TextEditingController();
    //   // Utiliza formSubmitted true para simular a tela de cadastro
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: Column(
    //           children: [
    //             CITUsername(controller: controller, formSubmitted: true),
    //             TextFormField(key: const Key('other-field')),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );

    //   // Digita um username com formato inválido (ex: contém "!" que não é permitido)
    //   await tester.enterText(find.byType(TextFormField).first, 'abc!');
      
    //   // Simula perda de foco
    //   await tester.tap(find.byKey(const Key('other-field')));
    //   await tester.pumpAndSettle();

    //   expect(find.text(CErrorMsgs.usernameInvalid), findsOneWidget);

    //   // Agora simula o envio do form (submissão)
    //   await tester.enterText(find.byType(TextFormField).first, 'abc!');
    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pump();

    //   expect(find.text(CErrorMsgs.usernameInvalid), findsOneWidget);
    // });

    // testWidgets(
    //     'Não mostrar erro de formato indevidamente para username com formato válido',
    //     (WidgetTester tester) async {
    //   final controller = TextEditingController();
    //   // Mesmo na tela de cadastro, se o formato estiver correto não deve haver erro
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: CITUsername(controller: controller, formSubmitted: true),
    //       ),
    //     ),
    //   );

    //   // Digita um username com formato válido (exemplo: pode conter ponto e underscore de forma válida)
    //   await tester.enterText(find.byType(TextFormField), 'usuario.valido');
      
    //   // Simula perda de foco
    //   FocusManager.instance.primaryFocus?.unfocus();
    //   await tester.pump();

    //   expect(find.text(CErrorMsgs.usernameInvalid), findsNothing);

    //   // Simula envio do form
    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pump();

    //   expect(find.text(CErrorMsgs.usernameInvalid), findsNothing);
    // });

    // testWidgets(
    //     'Mostrar erro de username repetido ao perder o foco e ao enviar form (tela de cadastro)',
    //     (WidgetTester tester) async {
    //   final controller = TextEditingController();
    //   // Para simular a tela de cadastro, usamos formSubmitted true.
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: Scaffold(
    //         body: Column(
    //           children: [
    //             CITUsername(controller: controller, formSubmitted: true),
    //             TextFormField(key: const Key('other-field')),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );

    //   // Digita o username que já existe
    //   await tester.enterText(
    //       find.byType(TextFormField).first, 'UsuarioExistente');

    //   // Simula perda de foco
    //   await tester.tap(find.byKey(const Key('other-field')));
    //   await tester.pumpAndSettle();

    //   expect(find.text(CErrorMsgs.usernameTaken), findsOneWidget);

    //   // Agora simula o envio do form (submissão)
    //   await tester.enterText(
    //       find.byType(TextFormField).first, 'UsuarioExistente');
    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pump();

    //   expect(find.text(CErrorMsgs.usernameTaken), findsOneWidget);
    // });
  });
}
