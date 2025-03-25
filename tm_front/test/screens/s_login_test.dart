import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_front/routes/app_routes.dart';
import 'package:tm_front/screens/password_recovery/spr_main.dart';
import 'package:tm_front/screens/register/user/sru_prof.dart';
import 'package:tm_front/utils/u_error_msgs.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/screens/s_homepage.dart';
import 'package:tm_front/screens/s_login.dart';

void main() {
  group('Tela de Login - Validações', () {
    testWidgets('SLogin-TST1: Exibe erro quando o formato do e-mail é inválido',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute, home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, 'email_invalido.com');
      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      expect(find.text(ErrorMsgs.emailInvalid), findsOneWidget);
    });

    testWidgets(
        'SLogin-TST2: Verifica aparição indevida do erro de formato de e-mail inválido',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute, home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, 'email_valido@mail.com');
      await tester.tap(find.text('Entrar'));
      await tester.pump();

      expect(find.text(ErrorMsgs.emailInvalid), findsNothing);
    });

    testWidgets('SLogin-TST3: Exibe erro quando o campo de e-mail está vazio',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute, home: SLogin()));
      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      expect(find.text(ErrorMsgs.emailEmpty), findsOneWidget);
    });

    testWidgets(
        'SLogin-TST4: Verifica aparição indevida do erro de campo de e-mail vazio',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute, home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, 'entrada_qualquer');
      await tester.tap(find.text('Entrar'));
      await tester.pump();

      expect(find.text(ErrorMsgs.emailEmpty), findsNothing);
    });

    testWidgets('SLogin-TST5: Exibe erro quando o campo de senha está vazio',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute, home: SLogin()));

      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      expect(find.text(ErrorMsgs.passwordEmpty), findsOneWidget);
    });

    testWidgets(
        'SLogin-TST6: Verifica aparição indevida do erro de campo de senha vazio',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute, home: SLogin()));

      await tester.enterText(find.byType(TextFormField).at(1), 'senha');

      await tester.tap(find.text('Entrar'));
      await tester.pump();

      expect(find.text(ErrorMsgs.passwordEmpty), findsNothing);
    });

    testWidgets(
        'SLogin-TST7: Verifica se o erro de repetição de email não aparece na tela de login',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute, home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, CITEmail.registeredEmail);
      await tester.tap(find.text('Entrar'));
      await tester.pump();

      expect(find.text(ErrorMsgs.emailTaken), findsNothing);
    });

    testWidgets('SLogin-TST8: Login válido redireciona para HomePage sem erro',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute, home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, "user@email.com");
      await tester.enterText(find.byType(TextFormField).at(1), "123456");

      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      expect(find.byType(SHomePage), findsOneWidget);
      expect(find.text(ErrorMsgs.loginNotFound), findsNothing);
    });

    testWidgets('SLogin-TST9: Tentativa de login com email não registrado',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute, home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, "email@inexistente.com");
      await tester.enterText(find.byType(TextFormField).at(1), "123456");

      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      expect(find.byType(SHomePage), findsNothing);
      expect(find.text(ErrorMsgs.loginNotFound), findsOneWidget);
    });

    testWidgets('SLogin-TST10: Tentativa de login com senha errada',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute, home: SLogin()));

      await tester.enterText(
          find.byType(TextFormField).first, "user@email.com");
      await tester.enterText(find.byType(TextFormField).at(1), "12345");

      await tester.tap(find.text('Entrar'));
      await tester.pumpAndSettle();

      expect(find.byType(SHomePage), findsNothing);
      expect(find.text(ErrorMsgs.loginNotFound), findsOneWidget);
    });

    testWidgets(
        'SLogin-TST11: Redirecionamento para SR1UserProf ao clicar em "Criar conta"',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute, home: SLogin()));

      // Realiza o tap no botão "Criar conta"
      await tester.tap(find.text('Criar conta'));
      await tester.pumpAndSettle();

      // Verifica se a tela de criação de conta (SR1UserProf) foi exibida
      expect(find.byType(SRUProf), findsOneWidget);
    });

    testWidgets(
        'SLogin-TST12: Redirecionamento para SPRMain ao clicar em "Esqueci minha senha"',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute, home: SLogin()));

      // Realiza o tap no botão "Esqueci minha senha"
      await tester.tap(find.text('Esqueci minha senha'));
      await tester.pumpAndSettle();

      // Verifica se a tela de recuperação de senha (SPRMain) foi exibida
      expect(find.byType(SPRMain), findsOneWidget);
    });
  });
}
