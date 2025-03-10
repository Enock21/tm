import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/components/c_error_msgs.dart';

void main() {
  group('CITEmail - Validações', () {
    test('Erro quando o campo de e-mail está vazio', () {
      final emailField = CITEmail(controller: TextEditingController());
      final validator = emailField.submitValidator;

      expect(validator(null), CErrorMsgs.emailEmpty);
      expect(validator(''), CErrorMsgs.emailEmpty);
    });

    test('Erro de formato de e-mail inválido', () {
      final emailField = CITEmail(controller: TextEditingController());
      final validator = emailField.submitValidator;

      expect(validator('email_invalido'), CErrorMsgs.emailInvalid);
    });

    test('Erro de email já cadastrado na tela de cadastro', () {
      final emailField =
          CITEmail(controller: TextEditingController(), isRegisterScreen: true);
      final validator = emailField.submitValidator;

      expect(validator(CITEmail.registeredEmail), CErrorMsgs.emailTaken);
    });

    test('Não exibe erro para e-mail válido', () {
      final emailField = CITEmail(controller: TextEditingController());
      final validator = emailField.submitValidator;

      expect(validator('email@valido.com'), null);
    });

    testWidgets('Erro de formato de e-mail inválido ao perder o foco',
        (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITEmail(controller: controller),
        ),
      ));

      // Digita um e-mail inválido
      await tester.enterText(find.byType(TextFormField), 'email_invalido');

      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pump();

      // Verifica se a mensagem de erro está visível na tela
      expect(find.text(CErrorMsgs.emailInvalid), findsOneWidget);
    });

    testWidgets(
        'Não exibe erro de formato de e-mail inválido ao perder o foco com email válido',
        (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITEmail(controller: controller),
        ),
      ));

      await tester.enterText(
          find.byType(TextFormField), CITEmail.registeredEmail);

      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pump();

      // Verifica se a mensagem de erro está visível na tela
      expect(find.text(CErrorMsgs.emailInvalid), findsNothing);
    });

    testWidgets(
        'Erro de email já cadastrado na tela de cadastro ao perder o foco',
        (WidgetTester tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CITEmail(controller: controller, isRegisterScreen: true),
        ),
      ));

      //Digitando email já cadastrado
      await tester.enterText(
          find.byType(TextFormField), CITEmail.registeredEmail);

      // Simula a perda de foco
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pump();

      // Verifica se a mensagem de erro "email já cadastrado" aparece na tela
      expect(find.text(CErrorMsgs.emailTaken), findsOneWidget);
    });

    testWidgets('Erro de email vazio não aparece ao perder foco',
        (WidgetTester tester) async {
      // Cria um controlador para o campo de e-mail
      final emailController = TextEditingController();

      // Constrói o widget dentro de um MaterialApp
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                CITEmail(
                  controller: emailController,
                  isRegisterScreen: true, // Para ativar as validações
                ),
                TextFormField(
                    key: const Key(
                        'other-field')), // Campo auxiliar para mudar o foco
              ],
            ),
          ),
        ),
      );

      // Garante que o campo de e-mail está na tela
      expect(find.byType(CITEmail), findsOneWidget);

      // Simula foco no campo de e-mail
      await tester.tap(find.byType(TextFormField).first);
      await tester.pump(); // Processa a mudança de estado

      // Simula perda de foco tocando em outro campo
      await tester.tap(find.byKey(const Key('other-field')));
      await tester.pumpAndSettle();

      // Verifica se NÃO há mensagens de erro visíveis
      expect(find.text(CErrorMsgs.emailEmpty), findsNothing);
    });
  });
}