// test/r_login_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_front/screens/s_login.dart';
import 'package:tm_front/utils/u_routes.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/components/input/text/cit_password.dart';

/// NavigatorObserver de teste para registrar as rotas acionadas.
class TestNavigatorObserver extends NavigatorObserver {
  final List<Route<dynamic>> routes = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routes.add(route);
    super.didPush(route, previousRoute);
  }
}

void main() {
  group('Testes de navegação a partir de SLogin', () {
    testWidgets('TRL1 - SLogin -> SPRMain: Recuperação de Senha',
        (WidgetTester tester) async {
      final observer = TestNavigatorObserver();

      await tester.pumpWidget(
        MaterialApp(
          home: const SLogin(),
          onGenerateRoute: URoutes.generateRoute,
          navigatorObservers: [observer],
        ),
      );

      // Procura e clica no botão "Esqueci minha senha"
      final forgotPasswordButton = find.text('Esqueci minha senha');
      expect(forgotPasswordButton, findsOneWidget);
      await tester.tap(forgotPasswordButton);
      await tester.pumpAndSettle();

      // Verifica se a última rota acionada é a SPRMain
      expect(observer.routes.last.settings.name, URoutes.sprMain);
    });

    testWidgets('TRL2 - SLogin -> HomePage: Login bem-sucedido',
        (WidgetTester tester) async {
      final observer = TestNavigatorObserver();

      await tester.pumpWidget(
        MaterialApp(
          home: const SLogin(),
          onGenerateRoute: URoutes.generateRoute,
          navigatorObservers: [observer],
        ),
      );

      // Insere as credenciais válidas (conforme definido em SLogin)
      await tester.enterText(find.byType(CITEmail), 'user@email.com');
      await tester.enterText(find.byType(CITPassword), '123456');

      // Procura e clica no botão "Entrar"
      final loginButton = find.widgetWithText(ElevatedButton, 'Entrar');
      expect(loginButton, findsOneWidget);
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // Verifica se a última rota acionada é a HomePage
      expect(observer.routes.last.settings.name, URoutes.sHomepage);
    });

    testWidgets('TRL3 - SLogin -> SRUProf: Início de Cadastro',
        (WidgetTester tester) async {
      final observer = TestNavigatorObserver();

      await tester.pumpWidget(
        MaterialApp(
          home: const SLogin(),
          onGenerateRoute: URoutes.generateRoute,
          navigatorObservers: [observer],
        ),
      );

      // Procura e clica no botão "Criar conta"
      final createAccountButton =
          find.widgetWithText(ElevatedButton, 'Criar conta');
      expect(createAccountButton, findsOneWidget);
      await tester.tap(createAccountButton);
      await tester.pumpAndSettle();

      // Verifica se a última rota acionada é a SRUProf
      expect(observer.routes.last.settings.name, URoutes.sruProf);
    });
  });
}
