import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tm_front/components/c_bottom_butt.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/components/c_header.dart';
import 'package:tm_front/components/visual/cv_gm_icon.dart';
import 'package:tm_front/providers/p_registration_data.dart';
import 'package:tm_front/utils/u_routes.dart';
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
    final userState = Provider.of<PRegistrationData>(context);
    final bool? isPlayer = userState.isPlayer;

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
                    AppBoxes.rowVSeparator,
                    CVGMIcon(),
                    AppBoxes.bellowTitleVSeparator,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CJustBodyMedium(
                            text:
                                'Como um mestre, você pode criar e organizar RPGs, recrutar jogadores para seus jogos, aceitar mestrar propostas de RPGs de outros jogadores ou mestres, convidar outros mestres para uma mestragem colaborativa e exibir suas preferências como mestre.'),
                        AppBoxes.textVSeparator,
                        CJustBodyMedium(
                            text:
                                'Para aproveitar o máximo que a Taverna Multiversal tem para te oferecer, é recomendado que você personalize seu perfil de mestre com algumas informações. Isso vai te ajudar a encontrar RPGs e RPGistas adequados aos seus gostos como mestre.'),
                        AppBoxes.textVSeparator,
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
          onConfirm: () {
            Provider.of<PRegistrationData>(context, listen: false)
                .setGMChoice(true);
            if (isPlayer == true) {
              Navigator.pushNamed(context, URoutes.srp2Intro);
            } else {
              Navigator.pushNamed(context, URoutes.srgm2Intro);
            }
          },
          onDecline: () {
            Provider.of<PRegistrationData>(context, listen: false)
                .setGMChoice(false);
            if (isPlayer == true) {
              Navigator.pushNamed(context, URoutes.srp2Intro);
            } else {
              Navigator.pushNamed(context, URoutes.sHomepage);
            }
          }),
    );
  }
}
