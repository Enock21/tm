import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tm_front/components/c_bottom_butt.dart';
import 'package:tm_front/components/c_header.dart';
import 'package:tm_front/components/c_just_body_medium.dart';
import 'package:tm_front/components/visual/cv_gm_icon.dart';
import 'package:tm_front/components/visual/cv_player_icon.dart';
import 'package:tm_front/utils/u_dialogs.dart';
import 'package:tm_front/utils/u_routes.dart';
import 'package:tm_front/utils/u_theme.dart';

class SRGM2Intro extends StatelessWidget {
  const SRGM2Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    CHeader(title: 'MESTRE'),
                    AppBoxes.rowVSeparator,
                    const CVGMIcon(),
                    AppBoxes.rowVSeparator,
                    CHeader(title: 'Pronto para Começar?', showBackButton: false),
                    AppBoxes.bellowTitleVSeparator,
                    CJustBodyMedium(
                        text:
                            'Preencha as informações seguintes para personalizar seu perfil de mestre.'),
                    AppBoxes.textVSeparator,
                    CJustBodyMedium(
                        text:
                            'Todos os campos a seguir são opcionais e você pode alterá-los depois.'),
                    AppBoxes.textVSeparator,
                    CJustBodyMedium(
                        text:
                            'Caso deseje interromper a personalização do seu perfil de mestre, você pode selecionar “Pular Tudo” a qualquer momento. Se fizer isso, o que já foi preenchido ficará salvo no seu perfil.')
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      // Rodapé fixo com os botões:
      bottomNavigationBar: CBottomButt(
        positiveText: 'Continuar',
        negativeText: 'Pular Tudo',
        onConfirm: () {
          Navigator.pushNamed(context, URoutes.srgm3Types);
        },
        onDecline: () async {
          final navigator = Navigator.of(context);
          bool shouldSkip = await skipAllRegistrationScreens(context);
          if (shouldSkip) {
            navigator.pushNamed(URoutes.sHomepage);
          }
        },
      ),
    );
  }
}
