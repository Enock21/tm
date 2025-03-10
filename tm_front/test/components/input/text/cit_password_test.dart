import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_front/components/input/text/cit_password.dart';
import 'package:tm_front/components/c_error_msgs.dart';

void main() {
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

  // testWidgets('Verificar comando de revelar texto', (WidgetTester tester) async {
  //   final controller = TextEditingController();

  //   await tester.pumpWidget(MaterialApp(
  //     home: Scaffold(
  //       body: CITPassword(controller: controller),
  //     ),
  //   ));

  //   // Obtém o campo de senha
  //   final textField = tester.widget<TextFormField>(find.byType(TextFormField));

  //   // Inicialmente, a senha deve estar oculta
  //   expect(textField.obscureText, isTrue);

  //   // Clica no botão de visibilidade
  //   await tester.tap(find.byIcon(Icons.visibility));
  //   await tester.pump();

  //   // Obtém o campo novamente para verificar a mudança
  //   final updatedTextField = tester.widget<TextFormField>(find.byType(TextFormField));
  //   expect(updatedTextField.obscureText, isFalse);
  // });

  // testWidgets('Verificar comando de esconder texto', (WidgetTester tester) async {
  //   final controller = TextEditingController();

  //   await tester.pumpWidget(MaterialApp(
  //     home: Scaffold(
  //       body: CITPassword(controller: controller),
  //     ),
  //   ));

  //   // Clica no botão para revelar o texto
  //   await tester.tap(find.byIcon(Icons.visibility));
  //   await tester.pump();

  //   // Verifica se o texto foi revelado
  //   var textField = tester.widget<TextFormField>(find.byType(TextFormField));
  //   expect(textField.obscureText, isFalse);

  //   // Clica novamente para esconder o texto
  //   await tester.tap(find.byIcon(Icons.visibility_off));
  //   await tester.pump();

  //   // Obtém o campo novamente e verifica se voltou a ser oculto
  //   textField = tester.widget<TextFormField>(find.byType(TextFormField));
  //   expect(textField.obscureText, isTrue);
  // });
}
