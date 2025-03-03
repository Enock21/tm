import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/components/input/text/cit_password.dart';
import 'package:tm_front/screens/s_login.dart';

void main() {
  group('Tela de Login - Validações', () {
    testWidgets('Exibe erro quando o formato do e-mail é inválido',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, 'email_invalido.com');
      await tester.tap(find.text('Entrar'));
      await tester.pump();

      expect(find.text(CITEmail.emailInvalidError), findsOneWidget);
    });

    testWidgets('Verifica aparição indevida do erro de formato de e-mail inválido',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, 'email_valido@mail.com');
      await tester.tap(find.text('Entrar'));
      await tester.pump();

      expect(find.text(CITEmail.emailInvalidError), findsNothing);
    });

    testWidgets('Exibe erro quando o campo de e-mail está vazio',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));

      await tester.tap(find.text('Entrar'));
      await tester.pump();

      expect(find.text(CITEmail.emailEmptyError), findsOneWidget);
    });

    testWidgets('Verifica aparição indevida do erro de campo de e-mail vazio',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, 'entrada_qualquer');
      await tester.tap(find.text('Entrar'));
      await tester.pump();

      expect(find.text(CITEmail.emailEmptyError), findsNothing);
    });

    testWidgets('Exibe erro quando o campo de senha está vazio',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));

      await tester.tap(find.text('Entrar'));
      await tester.pump();

      expect(find.text(CITPassword.passwordEmptyError), findsOneWidget);
    });

    testWidgets('Verifica aparição indevida do erro de campo de senha vazio',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).at(1), 'senha');

      await tester.tap(find.text('Entrar'));
      await tester.pump();

      expect(find.text(CITPassword.passwordEmptyError), findsNothing);
    });

    testWidgets('Verifica se o erro de repetição de email não aparece na tela de login',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, CITEmail.registeredEmail);
      await tester.tap(find.text('Entrar'));
      await tester.pump();

      expect(find.text(CITEmail.emailTakenError), findsNothing);
    });
  });
}
