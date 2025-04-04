import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tm_front/components/c_bottom_butt.dart';
import 'package:tm_front/components/c_search_checkbox.dart';
import 'package:tm_front/components/c_time_select_box.dart';
import 'package:tm_front/components/c_triple_select_box.dart';
import 'package:tm_front/components/c_header.dart';
import 'package:tm_front/components/c_just_body_medium.dart';
import 'package:tm_front/components/c_triple_selection.dart';
import 'package:tm_front/components/input/text/cit_long.dart';
import 'package:tm_front/components/visual/cv_gm_icon.dart';
import 'package:tm_front/components/visual/cv_player_icon.dart';
import 'package:tm_front/models/platform_type.dart';
import 'package:tm_front/providers/user_profile_state.dart';
import 'package:tm_front/utils/u_dialogs.dart';
import 'package:tm_front/utils/u_routes.dart';
import 'package:tm_front/utils/u_theme.dart';

class SRP8AboutMe extends StatelessWidget {
  const SRP8AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<UserProfileState>(context, listen: false);

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
                    CHeader(title: 'Fale Mais Sobre Você'),
                    AppBoxes.bellowTitleVSeparator,
                    CJustBodyMedium(
                        text:
                            'Cada um tem seus próprios gostos e experiências no mundo do RPG. Fique a vontade para se apresentar como jogador.'),
                    AppBoxes.textVSeparator,
                    CJustBodyMedium(
                        text:
                            'Campos deixados em branco não vão aparecer no seu perfil.'),
                    AppBoxes.setVSeparator,
                    Column(
                      children: [
                        Text('Gosto de jogar RPGs que...',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
                        AppBoxes.setVSeparator,
                        Text('Não gosto de jogar RPGs que...',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
                        AppBoxes.setVSeparator,
                        Text('Gosto de jogar com mestres que...',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
                        AppBoxes.setVSeparator,
                        Text('Não gosto de jogar com mestres que...',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
                        AppBoxes.setVSeparator,
                        Text('Gosto de jogar com jogadores que...',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
                        AppBoxes.setVSeparator,
                        Text('Não gosto de jogar com jogadores que...',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
                        AppBoxes.setVSeparator,
                        Text('Tive uma experiência boa jogando RPG quando...',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
                        AppBoxes.setVSeparator,
                        Text('Tive uma experiência ruim jogando RPG quando...',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
                        AppBoxes.setVSeparator,
                        Text('Outras coisas sobre mim como jogador',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
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
        positiveText: 'Continuar',
        negativeText: 'Pular Tudo',
        onConfirm: () {
          final navigator = Navigator.of(context);
          final isGM = Provider.of<UserProfileState>(context, listen: false).isGM;
          if (isGM == true) {
            navigator.pushNamed(URoutes.srgm2Intro);
          } else {
            navigator.pushNamed(URoutes.sHomepage);
          }
        },
        onDecline: () async {
          final navigator = Navigator.of(context);
          final isGM =
              Provider.of<UserProfileState>(context, listen: false).isGM;
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
