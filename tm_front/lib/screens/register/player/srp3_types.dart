import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tm_front/components/c_bottom_butt.dart';
import 'package:tm_front/components/c_box_selection.dart';
import 'package:tm_front/components/c_header.dart';
import 'package:tm_front/components/c_just_body_medium.dart';
import 'package:tm_front/components/c_triple_selection.dart';
import 'package:tm_front/components/visual/cv_player_icon.dart';
import 'package:tm_front/providers/user_profile_state.dart';
import 'package:tm_front/utils/u_routes.dart';
import 'package:tm_front/utils/u_theme.dart';

class SRP3Types extends StatelessWidget {
  const SRP3Types({Key? key}) : super(key: key);

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
                    CHeader(title: 'Tipos'),
                    AppBoxes.bellowTitleVSeparator,
                    CJustBodyMedium(
                        text:
                          'Existem várias formas de jogar RPG, cada uma com suas próprias características. Escolha os tipos que você tem ou não interesse em jogar a seguir.'),
                    AppBoxes.textVSeparator,
                    CJustBodyMedium(
                        text:
                          'Você pode apertar em cada tipo para ver uma breve descrição.'),
                    AppBoxes.setVSeparator,
                    // Nova seção de ícones e descrições:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.thumb_up, color: AppColors.positiveColor),
                            const SizedBox(width: 8),
                            Text('= Tenho interesse!', style: AppTexts.bodyMedium),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.sentiment_neutral, color: AppColors.neutralColor),
                            const SizedBox(width: 8),
                            Text('= Sem opinião formada.', style: AppTexts.bodyMedium),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.thumb_down, color: AppColors.negativeColor),
                            const SizedBox(width: 8),
                            Text('= Não tenho interesse!', style: AppTexts.bodyMedium),
                          ],
                        ),
                      ],
                    ),
                    AppBoxes.setVSeparator,
                    CBoxSelection(
                      title: 'Genérico',
                      leadingIcon: const Icon(Icons.gamepad, color: AppColors.nonInteractiveGreen),
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      initialSelection: TripleSelection.neutral,
                      onChanged: (selection){
                        print('Seleção $selection');
                      }
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
          // Ação para o botão "Continuar". Próxima tela.
        },
        onDecline: () {
          Navigator.pushNamed(context, URoutes.homepage);
        },
      ),
    );
  }
}
