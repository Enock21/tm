import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_front/components/c_error_msgs.dart';
import 'package:tm_front/screens/password_recovery/spr_alteration.dart';
import 'package:tm_front/screens/password_recovery/spr_main.dart';

void main() {
  group('Tela de Recuperação de Senha - Validações', () {
    testWidgets('Exibe erro quando o formato do e-mail é inválido', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRMain()));

      await tester.enterText(find.byType(TextFormField).first, 'email_invalido');
      await tester.tap(find.text('Enviar'));
      await tester.pump();

      expect(find.text(CErrorMsgs.emailInvalid), findsOneWidget);
    });

    testWidgets('Exibe erro quando o campo de e-mail está vazio', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRMain()));

      await tester.tap(find.text('Enviar'));
      await tester.pump();

      expect(find.text(CErrorMsgs.emailEmpty), findsOneWidget);
    });

    testWidgets('Exibe erro para email não encontrado', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRMain()));

      await tester.enterText(find.byType(TextFormField).first, 'naoexiste@email.com');
      await tester.tap(find.text('Enviar'));
      await tester.pump();

      expect(find.text(CErrorMsgs.emailNotFound), findsOneWidget);
    });

    testWidgets('Exibe feedback positivo para email válido', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRMain()));

      await tester.enterText(find.byType(TextFormField).first, 'user@email.com');
      await tester.tap(find.text('Enviar'));
      await tester.pumpAndSettle();

      expect(find.text('ENVIADO!'), findsOneWidget);
    });

    testWidgets('Não exibe erro para email válido', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRMain()));

      await tester.enterText(find.byType(TextFormField).first, 'user@email.com');
      await tester.tap(find.text('Enviar'));
      await tester.pumpAndSettle();

      expect(find.text(CErrorMsgs.emailInvalid), findsNothing);
      expect(find.text(CErrorMsgs.emailEmpty), findsNothing);
      expect(find.text(CErrorMsgs.emailNotFound), findsNothing);
    });
  });

  group('Tela de Alteração de Senha - Validações', () {
    testWidgets('Erro de senhas vazias', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRAlteration()));

      await tester.tap(find.text('Alterar Senha'));
      await tester.pump();

      expect(find.text(CErrorMsgs.passwordEmpty), findsNWidgets(2));
    });

    testWidgets('Erro de senha 1 vazia', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRAlteration()));

      await tester.enterText(find.byType(TextFormField).at(0), 'NovaSenha123');
      await tester.tap(find.text('Alterar Senha'));
      await tester.pump();

      expect(find.text(CErrorMsgs.passwordEmpty), findsOneWidget);
    });

    
    testWidgets('Erro de senha 2 vazia', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRAlteration()));

      await tester.enterText(find.byType(TextFormField).at(1), 'NovaSenha123');
      await tester.tap(find.text('Alterar Senha'));
      await tester.pump();

      expect(find.text(CErrorMsgs.passwordEmpty), findsOneWidget);
    });

    testWidgets('Erro de senhas diferentes', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRAlteration()));

      await tester.enterText(find.byType(TextFormField).at(0), 'NovaSenha123');
      await tester.enterText(find.byType(TextFormField).at(1), 'NovaSenha12');
      await tester.tap(find.text('Alterar Senha'));
      await tester.pump();

      expect(find.text(CErrorMsgs.passwordMismatch), findsOneWidget);
    });

    testWidgets('Exibe feedback positivo para alteração realizada com êxito', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRAlteration()));

      await tester.enterText(find.byType(TextFormField).at(0), 'NovaSenha123');
      await tester.enterText(find.byType(TextFormField).at(1), 'NovaSenha123');
      await tester.tap(find.text('Alterar Senha'));
      await tester.pumpAndSettle();

      expect(find.text('SENHA ALTERADA!'), findsOneWidget);
    });

    testWidgets('Não exibe erro para alteração realizada com êxito', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRAlteration()));

      await tester.enterText(find.byType(TextFormField).at(0), 'NovaSenha123');
      await tester.enterText(find.byType(TextFormField).at(1), 'NovaSenha123');
      await tester.tap(find.text('Alterar Senha'));
      await tester.pumpAndSettle();

      expect(find.text(CErrorMsgs.passwordEmpty), findsNothing);
      expect(find.text(CErrorMsgs.passwordMismatch), findsNothing);
    });
  });
}
