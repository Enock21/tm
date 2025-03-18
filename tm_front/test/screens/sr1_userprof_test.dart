import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_front/components/c_error_msgs.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/components/input/text/cit_username.dart';
import 'package:tm_front/screens/register/sr1_userprof.dart'; // ajuste o import conforme a organização do seu projeto

/// Navigator observer para verificar se houve transição de rota.
class TestNavigatorObserver extends NavigatorObserver {
  int didPushCount = 0;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    didPushCount++;
    super.didPush(route, previousRoute);
  }
}

void main() {
  group('Testes do widget SR1UserProf', () {
    testWidgets('Senhas não coincidem exibe erro "As senhas não correspondem"',
        (WidgetTester tester) async {
      // Monte o widget dentro de um MaterialApp.
      await tester.pumpWidget(const MaterialApp(home: SR1UserProf()));

      // Preenche os campos de senha e confirmação com valores diferentes.
      // Como há dois CITPassword (o primeiro para senha e o segundo para confirmação),
      // usamos .at(3) para o primeiro (posição: username, email, data, senha, confirmação)
      await tester.enterText(find.byType(TextFormField).at(3), 'password123');
      await tester.enterText(find.byType(TextFormField).at(4), 'differentPassword');

      // Tenta submeter o formulário.
      final nextButton = find.text('Próximo');
      await tester.ensureVisible(nextButton);
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      // Verifica se o erro de senhas não correspondentes é exibido.
      expect(find.text('As senhas não correspondem'), findsOneWidget);
    });

    testWidgets(
        'Não ocorre transição indevida de tela ao submeter form inválido',
        (WidgetTester tester) async {
      final navigatorObserver = TestNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: const SR1UserProf(),
        navigatorObservers: [navigatorObserver],
      ));

      // Sem preencher os campos, tenta submeter.
      final nextButton = find.text('Próximo');
      await tester.ensureVisible(nextButton);
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      // Verifica que nenhum push ocorreu na navegação.
      expect(navigatorObserver.didPushCount, equals(0));
    });

    testWidgets(
        'Todos os erros de campo vazio são emitidos simultaneamente ao tentar enviar o form',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SR1UserProf()));

      // Submete o formulário sem preencher nenhum campo.
      final nextButton = find.text('Próximo');
      await tester.ensureVisible(nextButton);
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      // Verifica os erros esperados:
      // Para username e email, espera-se os erros de campo vazio.
      expect(find.text(CErrorMsgs.usernameEmpty), findsOneWidget);
      expect(find.text(CErrorMsgs.emailEmpty), findsOneWidget);
      // Para os dois campos de senha, como ambos usam CITPassword e validam campo vazio,
      // espera-se dois erros de senha vazia.
      expect(find.text(CErrorMsgs.passwordEmpty), findsNWidgets(2));
    });

    testWidgets(
        'Erros de formato inválido de email e username são lançados simultaneamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SR1UserProf()));

      // Preenche username com formato inválido e email inválido.
      // O primeiro TextFormField é o do username; o segundo, o de email.
      await tester.enterText(find.byType(TextFormField).at(0), 'inv@lido!');
      await tester.enterText(find.byType(TextFormField).at(1), 'invalid-email');

      final nextButton = find.text('Próximo');
      await tester.ensureVisible(nextButton);
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      expect(find.text(CErrorMsgs.usernameInvalid), findsOneWidget);
      expect(find.text(CErrorMsgs.emailInvalid), findsOneWidget);
    });

    testWidgets(
        'Erros de username e email repetidos aparecem simultaneamente quando apropriado',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SR1UserProf()));

      // Preenche com username e email já registrados.
      await tester.enterText(
          find.byType(TextFormField).at(0), CITUsername.registeredUsername);
      await tester.enterText(
          find.byType(TextFormField).at(1), CITEmail.registeredEmail);

      final nextButton = find.text('Próximo');
      await tester.ensureVisible(nextButton);
      await tester.tap(nextButton);
      await tester.pumpAndSettle();

      expect(find.text(CErrorMsgs.usernameTaken), findsOneWidget);
      expect(find.text(CErrorMsgs.emailTaken), findsOneWidget);
    });
  });
}
