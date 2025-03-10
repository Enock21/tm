import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_front/components/input/text/cit_generic.dart';
import 'package:tm_front/components/input/text/cit_password.dart';
import 'package:tm_front/components/c_error_msgs.dart';

void main() {
  group('CITPassword - Validações', () {
  testWidgets('Verificar campo de senha vazia', (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Form(
            child: CITPassword(controller: controller),
          ),
        ),
      ));

      // Simula a submissão do formulário sem digitar nada
      await tester.tap(find.byType(TextFormField));
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      // Verifica se a mensagem de erro é exibida
      expect(find.text(CErrorMsgs.passwordEmpty), findsOneWidget);
    });

    testWidgets('Não exibe erro para senha preenchida',
        (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITPassword(controller: controller),
        ),
      ));

      // Digita uma senha válida
      await tester.enterText(find.byType(TextFormField), 'senhaSegura123');

      // Simula a perda de foco tocando fora do campo
      await tester.tap(find.byType(Scaffold));
      await tester.pump();

      // Verifica que a mensagem de erro não está presente
      expect(find.text(CErrorMsgs.passwordEmpty), findsNothing);
    });

    testWidgets('Verificar comando de revelar/ocultar texto', (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITPassword(controller: controller),
        ),
      ));

      // Obtém o widget CITGeneric
      final citGenericFinder = find.byType(CITGeneric);
      expect(citGenericFinder, findsOneWidget);

      // Verifica se obscureText é true inicialmente
      final citGenericWidget = tester.widget<CITGeneric>(citGenericFinder);
      expect(citGenericWidget.obscureText, isTrue);

      // Clica no botão para revelar a senha
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      // Verifica se obscureText se tornou false
      final updatedCitGenericWidget = tester.widget<CITGeneric>(citGenericFinder);
      expect(updatedCitGenericWidget.obscureText, isFalse);

      // Clica novamente no botão para ocultar a senha
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      // Verifica se obscureText voltou a ser true
      final secondUpdatedCitGenericWidget = tester.widget<CITGeneric>(citGenericFinder);
      expect(secondUpdatedCitGenericWidget.obscureText, isTrue);
    });
  });
}
