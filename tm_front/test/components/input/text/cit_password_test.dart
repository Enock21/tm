import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/cit_password.dart';
import 'package:tm_front/components/c_error_msgs.dart';

void main() {
  group('CITPassword - Validações', () {
    testWidgets('Erro quando o campo de senha está vazio', (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITPassword(controller: controller),
        ),
      ));

      // Simula a perda de foco tocando fora do campo
      await tester.tap(find.byType(Scaffold));
      await tester.pump();

      // Verifica se a mensagem de erro está visível na tela
      expect(find.text(CErrorMsgs.passwordEmpty), findsOneWidget);
    });

    testWidgets('Não exibe erro para senha preenchida', (WidgetTester tester) async {
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
  });

  group('CITPassword - Visibilidade da senha', () {
    testWidgets('Ícone de visibilidade alterna entre mostrar e ocultar senha', (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITPassword(controller: controller),
        ),
      ));

      // Obtém o campo de senha e o botão de visibilidade
      final passwordField = find.byType(TextFormField);
      final visibilityButton = find.byIcon(Icons.visibility);

      // Inicialmente, a senha deve estar oculta
      TextFormField fieldWidget = tester.widget(passwordField);
      expect(fieldWidget.obscureText, true);

      // Clica no botão de visibilidade para exibir a senha
      await tester.tap(visibilityButton);
      await tester.pump();

      // Verifica se a senha está visível
      fieldWidget = tester.widget(passwordField);
      expect(fieldWidget.obscureText, false);

      // Clica novamente para ocultar a senha
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      // Verifica se a senha está oculta novamente
      fieldWidget = tester.widget(passwordField);
      expect(fieldWidget.obscureText, true);
    });
  });
}
