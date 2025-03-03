import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_front/screens/password_recovery/spr_main.dart';

void main() {
  group('Tela de Recuperação de Senha - Validações', () {
    testWidgets('Exibe erro quando o formato do e-mail é inválido', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRMain()));

      await tester.enterText(find.byType(TextFormField).first, 'email_invalido');
      await tester.tap(find.text('Enviar'));
      await tester.pump();

      expect(find.text('E-mail inválido'), findsOneWidget);
    });

    testWidgets('Exibe erro quando o campo de e-mail está vazio', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRMain()));

      await tester.tap(find.text('Enviar'));
      await tester.pump();

      expect(find.text('Falta o e-mail'), findsOneWidget);
    });

    testWidgets('Exibe erro para email não encontrado', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRMain()));

      await tester.enterText(find.byType(TextFormField).first, 'naoexiste@email.com');
      await tester.tap(find.text('Enviar'));
      await tester.pump();

      expect(find.text('E-mail não encontrado'), findsOneWidget);
    });

    testWidgets('Exibe feedback positivo para email válido', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRMain()));

      await tester.enterText(find.byType(TextFormField).first, 'valido@email.com');
      await tester.tap(find.text('Enviar'));
      await tester.pumpAndSettle();

      expect(find.text('E-mail enviado com sucesso!'), findsOneWidget);
    });

    testWidgets('Não exibe erro para email válido', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRMain()));

      await tester.enterText(find.byType(TextFormField).first, 'valido@email.com');
      await tester.tap(find.text('Enviar'));
      await tester.pumpAndSettle();

      expect(find.text('E-mail inválido'), findsNothing);
      expect(find.text('Falta o e-mail'), findsNothing);
      expect(find.text('E-mail não encontrado'), findsNothing);
    });
  });

  group('Tela de Alteração de Senha - Validações', () {
    testWidgets('Erro de nova senha vazia', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRMain()));

      await tester.tap(find.text('Alterar senha'));
      await tester.pump();

      expect(find.text('Falta a nova senha'), findsOneWidget);
    });

    testWidgets('Erro de confirmação de senha vazia', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRMain()));

      await tester.enterText(find.byType(TextFormField).at(0), 'NovaSenha123');
      await tester.tap(find.text('Alterar senha'));
      await tester.pump();

      expect(find.text('Confirme a nova senha'), findsOneWidget);
    });

    testWidgets('Erro de senhas diferentes', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRMain()));

      await tester.enterText(find.byType(TextFormField).at(0), 'NovaSenha123');
      await tester.enterText(find.byType(TextFormField).at(1), 'SenhaErrada321');
      await tester.tap(find.text('Alterar senha'));
      await tester.pump();

      expect(find.text('As senhas não coincidem'), findsOneWidget);
    });

    testWidgets('Exibe feedback positivo para alteração realizada com êxito', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRMain()));

      await tester.enterText(find.byType(TextFormField).at(0), 'NovaSenha123');
      await tester.enterText(find.byType(TextFormField).at(1), 'NovaSenha123');
      await tester.tap(find.text('Alterar senha'));
      await tester.pumpAndSettle();

      expect(find.text('Senha alterada com sucesso!'), findsOneWidget);
    });

    testWidgets('Não exibe erro para alteração realizada com êxito', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SPRMain()));

      await tester.enterText(find.byType(TextFormField).at(0), 'NovaSenha123');
      await tester.enterText(find.byType(TextFormField).at(1), 'NovaSenha123');
      await tester.tap(find.text('Alterar senha'));
      await tester.pumpAndSettle();

      expect(find.text('Falta a nova senha'), findsNothing);
      expect(find.text('Confirme a nova senha'), findsNothing);
      expect(find.text('As senhas não coincidem'), findsNothing);
    });
  });
}
