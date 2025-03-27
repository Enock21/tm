// test/to_login_from_spr_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tm_front/screens/password_recovery/spr_alteration.dart';
import 'package:tm_front/screens/password_recovery/spr_expired_link.dart';
import 'package:tm_front/screens/s_login.dart';
import 'package:tm_front/utils/u_routes.dart';
import 'package:tm_front/utils/u_theme.dart'; // Para acesso aos estilos, se necessário
import 'package:tm_front/components/c_buttons.dart'; // Para TMButton

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
  group('Testes de Navegação - Recuperação de Senha', () {
    testWidgets('TLFS-TST1 - SPRAlteration -> SLogin: Retorno ao login após alterar senha',
        (WidgetTester tester) async {
      final observer = TestNavigatorObserver();

      // Inicializa o SPRAlteration
      await tester.pumpWidget(
        MaterialApp(
          home: const SPRAlteration(),
          onGenerateRoute: URoutes.generateRoute,
          navigatorObservers: [observer],
        ),
      );

      // Verifica que, inicialmente, o botão "Voltar ao Login" não está visível.
      expect(find.text('Voltar ao Login'), findsNothing);
      
      await tester.enterText(
        find.byType(TextFormField).first, "123456"
      );
      await tester.enterText(
        find.byType(TextFormField).at(1), "123456"
      );
      // Simula o fluxo de alteração de senha:
      // Aqui, pressionamos o botão "Alterar Senha". Na implementação do SPRAlteration,
      // quando as validações são aprovadas, o estado é atualizado (passwordChanged = true)
      // e a UI exibe o botão "Voltar ao Login".
      final alterarButton = find.widgetWithText(TMButton, 'Alterar Senha');
      expect(alterarButton, findsOneWidget);
      await tester.tap(alterarButton);
      await tester.pumpAndSettle();

      // Agora, espera-se que o botão "Voltar ao Login" esteja visível.
      final voltarButton = find.widgetWithText(TMButton, 'Voltar ao Login');
      expect(voltarButton, findsOneWidget);

      // Simula o clique no botão "Voltar ao Login"
      await tester.tap(voltarButton);
      await tester.pumpAndSettle();

      // Verifica se a última rota acionada é SLogin
      expect(observer.routes.last.settings.name, URoutes.sLogin);
    });

    testWidgets('TLFS-TST2 - SPRExpiredLink -> SLogin: Retorno ao login após link expirar',
        (WidgetTester tester) async {
      final observer = TestNavigatorObserver();

      // Inicializa o SPRExpiredLink
      await tester.pumpWidget(
        MaterialApp(
          home: const SPRExpiredLink(),
          onGenerateRoute: URoutes.generateRoute,
          navigatorObservers: [observer],
        ),
      );

      // Procura e clica no botão "Voltar ao Login"
      final voltarButton = find.widgetWithText(TMButton, 'Voltar ao Login');
      expect(voltarButton, findsOneWidget);
      await tester.tap(voltarButton);
      await tester.pumpAndSettle();

      // Verifica se a última rota acionada é SLogin
      expect(observer.routes.last.settings.name, URoutes.sLogin);
    });
  });
}
