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
import 'package:tm_front/providers/p_registration_data.dart';
import 'package:tm_front/utils/u_dialogs.dart';
import 'package:tm_front/utils/u_routes.dart';
import 'package:tm_front/utils/u_theme.dart';

class SRGM8AboutMe extends StatelessWidget {
  const SRGM8AboutMe({Key? key}) : super(key: key);

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
                    CHeader(title: 'MESTRE'),
                    AppBoxes.rowVSeparator,
                    const CVGMIcon(),
                    AppBoxes.rowVSeparator,
                    CHeader(
                        title: 'Fale Mais Sobre Você', showBackButton: false),
                    AppBoxes.bellowTitleVSeparator,
                    CJustBodyMedium(
                        text:
                            'Cada um tem seus próprios gostos e experiências no mundo do RPG. Fique a vontade para se apresentar como mestre.'),
                    AppBoxes.textVSeparator,
                    CJustBodyMedium(
                        text:
                            'Campos deixados em branco não vão aparecer no seu perfil.'),
                    AppBoxes.setVSeparator,
                    Column(
                      children: [
                        Text('Gosto de mestrar RPGs que...',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
                        AppBoxes.setVSeparator,
                        Text('Não gosto de mestrar RPGs que...',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
                        AppBoxes.setVSeparator,
                        Text(
                            'Gosto de mestrar colaborativamente com mestres que…',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
                        AppBoxes.setVSeparator,
                        Text(
                            'Não gosto de mestrar colaborativamente com mestres que…',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
                        AppBoxes.setVSeparator,
                        Text('Gosto de mestrar para jogadores que...',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
                        AppBoxes.setVSeparator,
                        Text('Não gosto de mestrar para jogadores que...',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
                        AppBoxes.setVSeparator,
                        Text('Tive uma experiência boa mestrando RPG quando...',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
                        AppBoxes.setVSeparator,
                        Text(
                            'Tive uma experiência ruim mestrando RPG quando...',
                            textAlign: TextAlign.center,
                            style: AppTexts.headlineMedium),
                        AppBoxes.textVSeparator,
                        CITLong(
                          hintText: 'Texto livre',
                        ),
                        AppBoxes.setVSeparator,
                        Text('Outras coisas sobre mim como mestre',
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
          Navigator.of(context).pushNamed(URoutes.sHomepage);
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
