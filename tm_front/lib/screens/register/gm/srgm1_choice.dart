import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tm_front/components/c_bottom_butt.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/components/c_header.dart';
import 'package:tm_front/components/visual/cv_gm_icon.dart';
import 'package:tm_front/routes/app_routes.dart';
import 'package:tm_front/components/c_just_body_medium.dart';
import 'package:tm_front/utils/u_theme.dart'; // Importa o TMButton

class SRGM1Choice extends StatelessWidget {
  final VoidCallback? onConfirm;
  final VoidCallback? onDecline;

  const SRGM1Choice({
    Key? key,
    this.onConfirm,
    this.onDecline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // O conteúdo que pode rolar fica no body:
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
                    CHeader(
                        title:
                            'Você deseja participar da Taverna Multiversal como Mestre?'),
                    const SizedBox(height: 48),
                    CVGMIcon(),
                    const SizedBox(height: 48),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CJustBodyMedium(
                            text:
                                'Como um mestre, você pode criar e organizar RPGs, recrutar jogadores para seus jogos, aceitar mestrar propostas de RPGs de outros jogadores ou mestres, convidar outros mestres para uma mestragem colaborativa e exibir suas preferências como mestre.'),
                        SizedBox(height: 15),
                        CJustBodyMedium(
                            text:
                                'Para aproveitar o máximo que a Taverna Multiversal tem para te oferecer, é recomendado que você personalize seu perfil de mestre com algumas informações. Isso vai te ajudar a encontrar RPGs e RPGistas adequados aos seus gostos como mestre.'),
                        SizedBox(height: 15),
                        CJustBodyMedium(
                            text:
                                'Esta escolha pode ser alterada a qualquer momento através do seu perfil.')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CBottomButt(
        positiveText: 'SIM',
        negativeText: 'NÃO',
        onConfirm: onConfirm ??
            () {
              //TODO: variável que indica se o user quer ser gm fica true
              Navigator.pushNamed(context, AppRoutes.srp2Intro);
            },
        onDecline: onDecline ??
            () {
              //TODO: variável que indica se o user quer ser gm fica false
              Navigator.pushNamed(context, AppRoutes.srp2Intro);
            },
      ),
    );
  }
}
