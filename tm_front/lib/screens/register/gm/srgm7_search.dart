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

class SRGM7Search extends StatelessWidget {
  const SRGM7Search({Key? key}) : super(key: key);

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
                    CHeader(title: 'MESTRE'),
                    AppBoxes.rowVSeparator,
                    const CVGMIcon(),
                    AppBoxes.rowVSeparator,
                    CHeader(title: 'O Que Você Procura?'),
                    AppBoxes.bellowTitleVSeparator,
                    CJustBodyMedium(
                        text:
                            'Propostas de jogos para você mestrar? Outros mestres para uma mestragem colaborativa? Jogadores para o seu jogo? Todas as opções anteriores? Marque suas preferências a seguir.'),
                    AppBoxes.setVSeparator,
                    Column(
                      children: [
                        CSearchCheckbox(
                          value: false,
                          onChanged: (bool? newValue) {
                            if (newValue != null) {}
                            //TODO: adicionar logica
                          },
                          title: 'Porcurando Jogo',
                          searchedIconAsset:
                              'assets/icons/procurando/proc-jogo.svg',
                        ),
                        SizedBox(height: 8),
                        CSearchCheckbox(
                          value: false,
                          onChanged: (bool? newValue) {
                            if (newValue != null) {}
                            //TODO: adicionar logica
                          },
                          title: 'Procurando Mestre',
                          searchedIconAsset:
                              'assets/icons/procurando/proc-mestre.svg',
                        ),
                        SizedBox(height: 8),
                        CSearchCheckbox(
                          value: false,
                          onChanged: (bool? newValue) {
                            if (newValue != null) {}
                            //TODO: adicionar logica
                          },
                          title: 'Procurando Jogador',
                          searchedIconAsset:
                              'assets/icons/procurando/proc-jogador.svg',
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
          Navigator.of(context).pushNamed(URoutes.srgm8AboutMe);
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
