import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tm_front/components/c_bottom_butt.dart';
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

class SRP6Time extends StatelessWidget {
  const SRP6Time({Key? key}) : super(key: key);

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
                    CHeader(title: 'Agenda'),
                    AppBoxes.bellowTitleVSeparator,
                    CJustBodyMedium(
                        text:
                            'Selecione os horários em que você está, geralmente, disponível para jogar RPG durante a semana. Essa informação vai minimizar conflitos de horários em jogos que você participar.'),
                    AppBoxes.textVSeparator,
                    CJustBodyMedium(
                        text:
                            'Aperte em cada dia da semana para expandir sua respectiva lista de horários.'),
                    AppBoxes.setVSeparator,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        CTimeSelectBox(title: 'Domingo'),
                        CTimeSelectBox(title: 'Segunda-feira'),
                        CTimeSelectBox(title: 'Terça-feira'),
                        CTimeSelectBox(title: 'Quarta-feira'),
                        CTimeSelectBox(title: 'Quinta-feira'),
                        CTimeSelectBox(title: 'Sexta-feira'),
                        CTimeSelectBox(title: 'Sábado'),
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
          //TODO: next screen
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
              navigator.pushNamed(URoutes.homepage);
            }
          }
        },
      ),
    );
  }
}
