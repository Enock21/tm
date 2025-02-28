import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_front/screens/s_login.dart';

void main() {
  group('Tela de Login - Validações', () {
    // testWidgets('Exibe erro quando o e-mail é inválido', (WidgetTester tester) async {
    //   await tester.pumpWidget(const MaterialApp(home: SLogin()));
      
    //   await tester.enterText(find.byType(TextFormField).first, 'email_invalido');
    //   await tester.tap(find.text('Entrar'));
    //   await tester.pump();
      
    //   expect(find.text('E-mail inválido'), findsOneWidget);
    // });

    testWidgets('Exibe erro quando o campo de e-mail está vazio', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SLogin()));
      
      await tester.tap(find.text('Entrar'));
      await tester.pump();
      
      expect(find.text('Falta o e-mail'), findsOneWidget);
    });

    // testWidgets('Exibe erro quando o campo de senha está vazio', (WidgetTester tester) async {
    //   await tester.pumpWidget(const MaterialApp(home: SLogin()));
      
    //   await tester.tap(find.text('Entrar'));
    //   await tester.pump();
      
    //   expect(find.text('Falta a senha'), findsOneWidget);
    // });
  });
}
