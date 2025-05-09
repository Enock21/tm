import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tm_front/components/c_bottom_butt.dart';
import 'package:tm_front/components/c_triple_select_box.dart';
import 'package:tm_front/components/c_header.dart';
import 'package:tm_front/components/c_just_body_medium.dart';
import 'package:tm_front/components/c_triple_selection.dart';
import 'package:tm_front/components/visual/cv_gm_icon.dart';
import 'package:tm_front/components/visual/cv_player_icon.dart';
import 'package:tm_front/models/platform_type.dart';
import 'package:tm_front/providers/p_registration_data.dart';
import 'package:tm_front/utils/u_dialogs.dart';
import 'package:tm_front/utils/u_routes.dart';
import 'package:tm_front/utils/u_theme.dart';

class SRGM5Plat extends StatelessWidget {
  const SRGM5Plat({Key? key}) : super(key: key);

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
                    CHeader(title: 'Plataformas de RPG', showBackButton: false),
                    AppBoxes.bellowTitleVSeparator,
                    CJustBodyMedium(
                        text:
                            'São meios usados para mestrar RPG. Em outras palavras, uma plataforma é onde você mestra. Aqui você pode declarar as que você está ou não está disposto a usar.'),
                    AppBoxes.textVSeparator,
                    CJustBodyMedium(
                        text:
                            'Você pode apertar em cada plataforma para ver uma breve descrição.'),
                    AppBoxes.setVSeparator,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.thumb_up,
                                color: AppColors.nonInteractiveGreen),
                            const SizedBox(width: 8),
                            Text('= Tenho interesse!',
                                style: AppTexts.bodyMedium),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.sentiment_neutral,
                                color: AppColors.neutralColor),
                            const SizedBox(width: 8),
                            Text('= Sem opinião formada.',
                                style: AppTexts.bodyMedium),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.thumb_down,
                                color: AppColors.nonInteractiveRed),
                            const SizedBox(width: 8),
                            Text('= Não tenho interesse!',
                                style: AppTexts.bodyMedium),
                          ],
                        ),
                      ],
                    ),
                    AppBoxes.setVSeparator,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: platformTypes.map((platform) {
                        return CTripleSelectBox(
                          title: platform.title,
                          description: platform.description,
                          iconAsset: platform.iconAsset,
                          onChanged: (selection) {
                            print(
                                'Plataforma ${platform.title}: seleção $selection');
                          },
                        );
                      }).toList(),
                    )
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
          Navigator.of(context).pushNamed(URoutes.srgm6Time);
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
