import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_front/screens/register/sr1_userprof.dart';
import 'package:tm_front/components/c_error_msgs.dart';

void main() {
  group('Tela de Cadastro - Validações', () {
    testWidgets('Exibe erro quando o formato do username é inválido',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SR1UserProf()));

      await tester.enterText(find.byType(TextFormField).first, 'inv@lido!');
      await tester.tap(find.text('Próximo'));
      await tester.pump();

      expect(find.text(CErrorMsgs.usernameInvalid), findsOneWidget);
    });

    testWidgets('Exibe erro quando o username já está cadastrado',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SR1UserProf()));

      await tester.enterText(
          find.byType(TextFormField).first, 'UsuarioExistente');
      await tester.tap(find.text('Próximo'));
      await tester.pump();

      expect(find.text(CErrorMsgs.usernameTaken), findsOneWidget);
    });

    testWidgets('Exibe erro quando o e-mail já está cadastrado',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SR1UserProf()));

      await tester.enterText(
          find.byType(TextFormField).at(1), 'email@existente.com');
      await tester.tap(find.text('Próximo'));
      await tester.pump();

      expect(find.text(CErrorMsgs.emailTaken), findsOneWidget);
    });

    testWidgets('Exibe erro quando o formato do e-mail é inválido',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SR1UserProf()));

      await tester.enterText(
          find.byType(TextFormField).at(1), 'email_invalido.com');
      await tester.tap(find.text('Próximo'));
      await tester.pump();

      expect(find.text(CErrorMsgs.emailInvalid), findsOneWidget);
    });

    testWidgets('Exibe erro quando o campo de e-mail está vazio',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SR1UserProf()));

      await tester.tap(find.text('Próximo'));
      await tester.pump();

      expect(find.text(CErrorMsgs.emailEmpty), findsOneWidget);
    });

    testWidgets('Exibe erro quando o campo de username está vazio',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SR1UserProf()));

      await tester.tap(find.text('Próximo'));
      await tester.pump();

      expect(find.text(CErrorMsgs.usernameEmpty), findsOneWidget);
    });

    testWidgets('Exibe erro quando o campo de senha está vazio',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SR1UserProf()));

      await tester.tap(find.text('Próximo'));
      await tester.pump();

      expect(find.text(CErrorMsgs.passwordEmpty), findsOneWidget);
    });

    testWidgets('Exibe erro quando o campo de confirmação de senha está vazio',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SR1UserProf()));

      await tester.enterText(find.byType(TextFormField).at(3), 'NovaSenha123');
      await tester.tap(find.text('Próximo'));
      await tester.pump();

      expect(find.text(CErrorMsgs.passwordMismatch), findsOneWidget);
    });

    testWidgets('Exibe erro quando as senhas não coincidem', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: SR1UserProf()));

      await tester.enterText(find.byType(TextFormField).at(3), 'NovaSenha123');
      await tester.enterText(
          find.byType(TextFormField).at(4), 'SenhaDiferente');
      await tester.tap(find.text('Próximo'));
      await tester.pump();

      expect(find.text(CErrorMsgs.passwordMismatch), findsOneWidget);
    });
  });
}
