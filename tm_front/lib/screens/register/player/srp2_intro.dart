import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tm_front/components/c_bottom_butt.dart';
import 'package:tm_front/components/c_header.dart';
import 'package:tm_front/components/c_just_body_medium.dart';
import 'package:tm_front/components/visual/cv_player_icon.dart';
import 'package:tm_front/providers/p_registration_data.dart';
import 'package:tm_front/utils/u_dialogs.dart';
import 'package:tm_front/utils/u_routes.dart';
import 'package:tm_front/utils/u_theme.dart';

class SRP2Intro extends StatefulWidget {
  const SRP2Intro({Key? key}) : super(key: key);

  @override
  _SRP2IntroState createState() => _SRP2IntroState();
}

class _SRP2IntroState extends State<SRP2Intro> {
  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<PRegistrationData>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
                    CHeader(title: 'JOGADOR'),
                    AppBoxes.rowVSeparator,
                    const CVPlayerIcon(),
                    AppBoxes.rowVSeparator,
                    CHeader(
                        title: 'Pronto para Começar?', showBackButton: false),
                    AppBoxes.bellowTitleVSeparator,
                    CJustBodyMedium(
                        text:
                            'Preencha as informações seguintes para personalizar seu perfil de jogador.'),
                    AppBoxes.textVSeparator,
                    CJustBodyMedium(
                        text:
                            'Todos os campos a seguir são opcionais e você pode alterá-los depois.'),
                    AppBoxes.textVSeparator,
                    CJustBodyMedium(
                        text:
                            'Caso deseje interromper a personalização do seu perfil de jogador, você pode selecionar “Pular Tudo” a qualquer momento. Se fizer isso, o que já foi preenchido ficará salvo no seu perfil.')
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CBottomButt(
        positiveText: 'Continuar',
        negativeText: 'Pular Tudo',
        onConfirm: () {
          Navigator.pushNamed(context, URoutes.srp3Types);
        },
        onDecline: () async {
          final navigator = Navigator.of(context);
          final isGM =
              Provider.of<PRegistrationData>(context, listen: false).isGM;
          bool shouldSkip = await skipAllRegistrationScreens(context);
          if (shouldSkip) {
            if (isGM == true) {
              navigator.pushNamed(URoutes.srgm2Intro);
            } else {
              navigator.pushNamed(URoutes.sHomepage);
            }
          }
        },
      ),
    );
  }
}
