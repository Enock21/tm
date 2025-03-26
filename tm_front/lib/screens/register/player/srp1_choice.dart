import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tm_front/components/c_bottom_butt.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/components/c_header.dart';
import 'package:tm_front/components/visual/cv_player_icon.dart';
import 'package:tm_front/routes/app_routes.dart';
import 'package:tm_front/components/c_just_body_medium.dart';
import 'package:tm_front/utils/u_theme.dart'; // Importa o TMButton

class SRP1Choice extends StatelessWidget {
  final VoidCallback? onConfirm;
  final VoidCallback? onDecline;

  const SRP1Choice({
    Key? key,
    this.onConfirm,
    this.onDecline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // Conteúdo rolável no body:
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 390),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CHeader(
                        title:
                            'Você deseja participar da Taverna Multiversal como Jogador?'),
                    const SizedBox(height: 48),
                    CVPlayerIcon(),
                    const SizedBox(height: 48),
                    // Texto descritivo
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CJustBodyMedium(
                            text:
                                'Como um jogador, você pode se inscrever para jogar em RPGs, participar de grupos de jogadores, criar propostas de jogos para mestres narrarem e exibir suas preferências como jogador.'),
                        SizedBox(height: 15),
                        CJustBodyMedium(
                            text:
                                'Para aproveitar o máximo que a Taverna Multiversal tem para te oferecer, é recomendado que você personalize seu perfil de jogador com algumas informações. Isso vai te ajudar a encontrar RPGs e RPGistas adequados aos seus gostos como jogador.'),
                        SizedBox(height: 15),
                        CJustBodyMedium(
                            text:
                                'Esta escolha pode ser alterada a qualquer momento através do seu perfil.'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      // Rodapé fixo com os botões:
      bottomNavigationBar: CBottomButt(
        positiveText: 'SIM',
        negativeText: 'NÃO',
        onConfirm: onConfirm ??
            () {
              //TODO: variável que indica se o user quer ser player fica true
              Navigator.pushNamed(context, AppRoutes.srgm1Choice);
            },
        onDecline: onDecline ??
            () {
              //TODO: variável que indica se o user quer ser player fica false
              Navigator.pushNamed(context, AppRoutes.srgm1Choice);
            },
      ),
    );
  }
}
