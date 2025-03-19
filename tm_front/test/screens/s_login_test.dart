import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_front/utils/u_error_msgs.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/screens/s_homepage.dart';
import 'package:tm_front/screens/s_login.dart';

void main() {
  group('Tela de Login - Validações', () {
    testWidgets('SLogin-TST1: Exibe erro quando o formato do e-mail é inválido',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, 'email_invalido.com');
      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      expect(find.text(CErrorMsgs.emailInvalid), findsOneWidget);
    });

    testWidgets(
        'SLogin-TST2: Verifica aparição indevida do erro de formato de e-mail inválido',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, 'email_valido@mail.com');
      await tester.tap(find.text('Entrar'));
      await tester.pump();

      expect(find.text(CErrorMsgs.emailInvalid), findsNothing);
    });

    testWidgets('SLogin-TST3: Exibe erro quando o campo de e-mail está vazio',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));
      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      expect(find.text(CErrorMsgs.emailEmpty), findsOneWidget);
    });

    testWidgets('SLogin-TST4: Verifica aparição indevida do erro de campo de e-mail vazio',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, 'entrada_qualquer');
      await tester.tap(find.text('Entrar'));
      await tester.pump();

      expect(find.text(CErrorMsgs.emailEmpty), findsNothing);
    });

    testWidgets('SLogin-TST5: Exibe erro quando o campo de senha está vazio',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));

      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      expect(find.text(CErrorMsgs.passwordEmpty), findsOneWidget);
    });

    testWidgets('SLogin-TST6: Verifica aparição indevida do erro de campo de senha vazio',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));

      await tester.enterText(find.byType(TextFormField).at(1), 'senha');

      await tester.tap(find.text('Entrar'));
      await tester.pump();

      expect(find.text(CErrorMsgs.passwordEmpty), findsNothing);
    });

    testWidgets(
        'SLogin-TST7: Verifica se o erro de repetição de email não aparece na tela de login',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, CITEmail.registeredEmail);
      await tester.tap(find.text('Entrar'));
      await tester.pump();

      expect(find.text(CErrorMsgs.emailTaken), findsNothing);
    });

    testWidgets('SLogin-TST8: Login válido redireciona para HomePage sem erro',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, "user@email.com");
      await tester.enterText(find.byType(TextFormField).at(1), "123456");

      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
      expect(find.text(CErrorMsgs.loginNotFound), findsNothing);
    });

    testWidgets('SLogin-TST9: Tentativa de login com email não registrado',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, "email@inexistente.com");
      await tester.enterText(find.byType(TextFormField).at(1), "123456");

      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsNothing);
      expect(find.text(CErrorMsgs.loginNotFound), findsOneWidget);
    });

    testWidgets('SLogin-TST10: Tentativa de login com senha errada',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, "user@email.com");
      await tester.enterText(find.byType(TextFormField).at(1), "12345");

      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsNothing);
      expect(find.text(CErrorMsgs.loginNotFound), findsOneWidget);
    });
  });
}
