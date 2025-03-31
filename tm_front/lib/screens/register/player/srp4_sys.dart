import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tm_front/components/c_bottom_butt.dart';
import 'package:tm_front/components/c_game_type_box.dart';
import 'package:tm_front/components/c_header.dart';
import 'package:tm_front/components/c_just_body_medium.dart';
import 'package:tm_front/components/c_triple_selection.dart';
import 'package:tm_front/components/visual/cv_player_icon.dart';
import 'package:tm_front/models/game_type.dart';
import 'package:tm_front/providers/user_profile_state.dart';
import 'package:tm_front/utils/u_routes.dart';
import 'package:tm_front/utils/u_theme.dart';

class SRP4Sys extends StatelessWidget {
  const SRP4Sys({Key? key}) : super(key: key);

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
                    CHeader(title: 'Sistemas de RPG'),
                    AppBoxes.bellowTitleVSeparator,
                    CJustBodyMedium(
                        text:
                            'Existem vários sistemas de RPG: conjuntos de regras que ajudam a organizar e balancear o jogo. Aqui você pode destacar os que você tem ou não interesse em jogar.'),
                    AppBoxes.textVSeparator,
                    CJustBodyMedium(
                        text:
                            'Sistemas que não são listados aqui são considerados de preferência neutra.'),
                    AppBoxes.setVSeparator,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.thumb_up,
                                color: AppColors.neutralColor),
                            const SizedBox(width: 8),
                            Text('= Tenho interesse!',
                                style: AppTexts.bodyMedium),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.thumb_down,
                                color: AppColors.neutralColor),
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
                      children: gameTypes.map((game) {
                        return CGameTypeBox(
                          title: game.title,
                          description: game.description,
                          iconAsset: game.iconAsset, // Passa o caminho do SVG
                          onChanged: (selection) {
                            print('Tipo ${game.title}: seleção $selection');
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
          // Ação para o botão "Continuar". Próxima tela.
        },
        onDecline: () {
          Navigator.pushNamed(context, URoutes.homepage);
        },
      ),
    );
  }
}
