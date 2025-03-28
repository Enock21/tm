// test/from_sru_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tm_front/components/input/ci_date.dart';
import 'package:tm_front/components/input/text/cit_email.dart';
import 'package:tm_front/components/input/text/cit_password.dart';
import 'package:tm_front/components/input/text/cit_username.dart';
import 'package:tm_front/providers/user_profile_state.dart';
import 'package:tm_front/screens/register/user/sru_prof.dart';
import 'package:tm_front/screens/register/player/srp1_choice.dart';
import 'package:tm_front/screens/register/player/srp2_intro.dart';
import 'package:tm_front/screens/register/gm/srgm1_choice.dart';
import 'package:tm_front/screens/register/gm/srgm2_intro.dart';
import 'package:tm_front/screens/s_homepage.dart';
import 'package:tm_front/utils/u_routes.dart';
import 'package:tm_front/components/c_buttons.dart'; // Para TMButton

/// NavigatorObserver de teste que registra as rotas empurradas.
class TestNavigatorObserver extends NavigatorObserver {
  final List<Route<dynamic>> routes = [];
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routes.add(route);
    super.didPush(route, previousRoute);
  }
}

void main() {
  group('Testes de Navegação do Fluxo de Cadastro (SRUProf e subsequentes)', () {
    // Fluxo 1:
    // SRUProf -> SRP1Choice (decline) -> SRGM1Choice (decline) -> HomePage
    testWidgets(
      'Flow 1: Cadastro de perfil de user genérico apenas',
      (WidgetTester tester) async {
        final observer = TestNavigatorObserver();
        await tester.pumpWidget(
          ChangeNotifierProvider(
            create: (_) => UserProfileState(),
            child: MaterialApp(
              initialRoute: URoutes.sruProf,
              onGenerateRoute: URoutes.generateRoute,
              navigatorObservers: [observer],
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Preencher os dados de cadastro (valores válidos)
        await tester.enterText(find.byType(CITUsername), 'TestUser');
        await tester.enterText(find.byType(CITEmail), 'test@example.com');

        final dateField = find.byType(CIDate);
        final textField = tester.widget<TextFormField>(find.descendant(
          of: dateField,
          matching: find.byType(TextFormField),
        ));
        textField.controller?.text = '01/01/2000';

        // Existem dois campos de senha; preenchemos ambos com o mesmo valor
        final passwordFields = find.byType(CITPassword);
        expect(passwordFields, findsNWidgets(2));
        await tester.enterText(passwordFields.at(0), 'password123');
        await tester.enterText(passwordFields.at(1), 'password123');

        // Tocar no botão "Próximo" para submeter o formulário
        final nextButton = find.text('Próximo');
        await tester.ensureVisible(nextButton);
        expect(nextButton, findsOneWidget);
        await tester.tap(nextButton);//Comportamento estranho, pulando o bloco de WidgetsBinding.instance.addPostFrameCallback((_) {
        await tester.pumpAndSettle();

        // Em SRP1Choice, toque no botão "NÃO" (decline)
        final srp1Decline = find.text('NÃO');
        //await tester.ensureVisible(srp1Decline);
        expect(srp1Decline, findsOneWidget);//Erro: widget nao encontrado
        await tester.tap(srp1Decline);
        await tester.pumpAndSettle();

        // Em SRGM1Choice, toque no botão "NÃO" (decline)
        final srgm1Decline = find.text('NÃO');
        expect(srgm1Decline, findsOneWidget);
        await tester.tap(srgm1Decline);
        await tester.pumpAndSettle();

        // Espera que a última rota seja HomePage
        expect(observer.routes.last.settings.name, URoutes.homepage);
      },
    );


    // Fluxo 2:
    // SRUProf -> SRP1Choice (confirm) -> SRGM1Choice (decline) -> SRP2Intro (pular tudo) -> HomePage
    testWidgets(
      'Flow 2: Cadastro de perfil de jogador apenas, pulando etapa de dados',
      (WidgetTester tester) async {
        final observer = TestNavigatorObserver();
        await tester.pumpWidget(
          ChangeNotifierProvider(
            create: (_) => UserProfileState(),
            child: MaterialApp(
              initialRoute: URoutes.sruProf,
              onGenerateRoute: URoutes.generateRoute,
              navigatorObservers: [observer],
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Preencher os dados de cadastro (valores válidos)
        await tester.enterText(find.byType(CITUsername), 'TestUser');
        await tester.enterText(find.byType(CITEmail), 'test@example.com');
        final dateField = find.byType(CIDate);
        final textField = tester.widget<TextFormField>(find.descendant(
          of: dateField,
          matching: find.byType(TextFormField),
        ));
        textField.controller?.text = '01/01/2000';
        // Existem dois campos de senha; preenchemos ambos com o mesmo valor
        final passwordFields = find.byType(CITPassword);
        expect(passwordFields, findsNWidgets(2));
        await tester.enterText(passwordFields.at(0), 'password123');
        await tester.enterText(passwordFields.at(1), 'password123');

        // Em SRUProf, toque no botão "Próximo"
        final nextButton = find.widgetWithText(ElevatedButton, 'Próximo');
        expect(nextButton, findsOneWidget);
        await tester.ensureVisible(nextButton);
        await tester.tap(nextButton);
        await tester.pumpAndSettle();

        // Em SRP1Choice, toque no botão "SIM" (confirm)
        final srp1Confirm = find.widgetWithText(TMButton, 'SIM');
        expect(srp1Confirm, findsOneWidget);
        await tester.tap(srp1Confirm);
        await tester.pumpAndSettle();

        // Em SRGM1Choice, toque no botão "NÃO" (decline)
        final srgm1Decline = find.widgetWithText(TMButton, 'NÃO');
        expect(srgm1Decline, findsOneWidget);
        await tester.tap(srgm1Decline);
        await tester.pumpAndSettle();

        // Deve navegar para SRP2Intro
        expect(observer.routes.last.settings.name, URoutes.srp2Intro);

        // Em SRP2Intro, toque no botão "Pular Tudo" (negative button)
        final pularTudoSRP2 = find.widgetWithText(TMButton, 'Pular Tudo');
        expect(pularTudoSRP2, findsOneWidget);
        await tester.tap(pularTudoSRP2);
        await tester.pumpAndSettle();

        // Deve navegar para HomePage
        expect(observer.routes.last.settings.name, URoutes.homepage);
      },
    );

    // Fluxo 3:
    // SRUProf -> SRP1Choice (decline) -> SRGM1Choice (confirm) -> SRGM2Intro (pular tudo) -> HomePage
    testWidgets(
      'Flow 3: Cadastro de perfil de mestre apenas, pulando etapa de dados',
      (WidgetTester tester) async {
        final observer = TestNavigatorObserver();
        await tester.pumpWidget(
          ChangeNotifierProvider(
            create: (_) => UserProfileState(),
            child: MaterialApp(
              initialRoute: URoutes.sruProf,
              onGenerateRoute: URoutes.generateRoute,
              navigatorObservers: [observer],
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Preencher os dados de cadastro (valores válidos)
        await tester.enterText(find.byType(CITUsername), 'TestUser');
        await tester.enterText(find.byType(CITEmail), 'test@example.com');
        final dateField = find.byType(CIDate);
        final textField = tester.widget<TextFormField>(find.descendant(
          of: dateField,
          matching: find.byType(TextFormField),
        ));
        textField.controller?.text = '01/01/2000';
        // Existem dois campos de senha; preenchemos ambos com o mesmo valor
        final passwordFields = find.byType(CITPassword);
        expect(passwordFields, findsNWidgets(2));
        await tester.enterText(passwordFields.at(0), 'password123');
        await tester.enterText(passwordFields.at(1), 'password123');

        // Em SRUProf, toque no botão "Próximo"
        final nextButton = find.widgetWithText(ElevatedButton, 'Próximo');
        expect(nextButton, findsOneWidget);
        await tester.ensureVisible(nextButton);
        await tester.tap(nextButton);
        await tester.pumpAndSettle();

        // Em SRP1Choice, toque no botão "NÃO" (decline)
        final srp1Decline = find.widgetWithText(TMButton, 'NÃO');
        expect(srp1Decline, findsOneWidget);
        await tester.tap(srp1Decline);
        await tester.pumpAndSettle();

        // Em SRGM1Choice, toque no botão "SIM" (confirm)
        final srgm1Confirm = find.widgetWithText(TMButton, 'SIM');
        expect(srgm1Confirm, findsOneWidget);
        await tester.tap(srgm1Confirm);
        await tester.pumpAndSettle();

        // Deve navegar para SRGM2Intro
        expect(observer.routes.last.settings.name, URoutes.srgm2Intro);

        // Em SRGM2Intro, toque no botão "Pular Tudo"
        final pularTudoSRGM2 = find.widgetWithText(TMButton, 'Pular Tudo');
        expect(pularTudoSRGM2, findsOneWidget);
        await tester.tap(pularTudoSRGM2);
        await tester.pumpAndSettle();

        // Espera que a última rota seja HomePage
        expect(observer.routes.last.settings.name, URoutes.homepage);
      },
    );

    // Fluxo 4:
    // SRUProf -> SRP1Choice (confirm) -> SRGM1Choice (confirm) ->
    // SRP2Intro (pular tudo) -> SRGM2Intro (pular tudo) -> HomePage
    testWidgets(
      'Flow 4: Cadastro de perfil de jogador e mestre, pulando ambas as etapas',
      (WidgetTester tester) async {
        final observer = TestNavigatorObserver();
        await tester.pumpWidget(
          ChangeNotifierProvider(
            create: (_) => UserProfileState(),
            child: MaterialApp(
              initialRoute: URoutes.sruProf,
              onGenerateRoute: URoutes.generateRoute,
              navigatorObservers: [observer],
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Preencher os dados de cadastro (valores válidos)
        await tester.enterText(find.byType(CITUsername), 'TestUser');
        await tester.enterText(find.byType(CITEmail), 'test@example.com');
        final dateField = find.byType(CIDate);
        final textField = tester.widget<TextFormField>(find.descendant(
          of: dateField,
          matching: find.byType(TextFormField),
        ));
        textField.controller?.text = '01/01/2000';
        // Existem dois campos de senha; preenchemos ambos com o mesmo valor
        final passwordFields = find.byType(CITPassword);
        expect(passwordFields, findsNWidgets(2));
        await tester.enterText(passwordFields.at(0), 'password123');
        await tester.enterText(passwordFields.at(1), 'password123');

        // Em SRUProf, toque no botão "Próximo"
        final nextButton = find.widgetWithText(ElevatedButton, 'Próximo');
        expect(nextButton, findsOneWidget);
        await tester.ensureVisible(nextButton);
        await tester.tap(nextButton);
        await tester.pumpAndSettle();

        // Em SRP1Choice, toque no botão "SIM" (confirm)
        final srp1Confirm = find.widgetWithText(TMButton, 'SIM');
        expect(srp1Confirm, findsOneWidget);
        await tester.tap(srp1Confirm);
        await tester.pumpAndSettle();

        // Em SRGM1Choice, toque no botão "SIM" (confirm)
        final srgm1Confirm = find.widgetWithText(TMButton, 'SIM');
        expect(srgm1Confirm, findsOneWidget);
        await tester.tap(srgm1Confirm);
        await tester.pumpAndSettle();

        // Deve navegar para SRP2Intro
        expect(observer.routes.last.settings.name, URoutes.srp2Intro);

        // Em SRP2Intro, toque no botão "Pular Tudo"
        final pularTudoSRP2 = find.widgetWithText(TMButton, 'Pular Tudo');
        expect(pularTudoSRP2, findsOneWidget);
        await tester.tap(pularTudoSRP2);
        await tester.pumpAndSettle();

        // Após SRP2Intro, como a escolha de player era confirmada e GM também foi confirmada,
        // o fluxo em SRGM1Choice determina que se isPlayer == true, a navegação acontece para SRP2Intro,
        // e em SRP2Intro, se userProfile.isGM for true, o onDecline navega para URoutes.srgm2Intro.
        // Assim, deve navegar para SRGM2Intro.
        expect(observer.routes.last.settings.name, URoutes.srgm2Intro);

        // Em SRGM2Intro, toque no botão "Pular Tudo"
        final pularTudoSRGM2 = find.widgetWithText(TMButton, 'Pular Tudo');
        expect(pularTudoSRGM2, findsOneWidget);
        await tester.tap(pularTudoSRGM2);
        await tester.pumpAndSettle();

        // Por fim, deve navegar para HomePage
        expect(observer.routes.last.settings.name, URoutes.homepage);
      },
    );
  });
}
