import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tm_front/components/c_bottom_butt.dart';
import 'package:tm_front/components/c_double_selection.dart';
import 'package:tm_front/components/c_game_sys_box.dart';
import 'package:tm_front/components/c_triple_select_box.dart';
import 'package:tm_front/components/c_header.dart';
import 'package:tm_front/components/c_just_body_medium.dart';
import 'package:tm_front/components/c_triple_selection.dart';
import 'package:tm_front/components/visual/cv_player_icon.dart';
import 'package:tm_front/models/game_type.dart';
import 'package:tm_front/providers/user_profile_state.dart';
import 'package:tm_front/utils/u_dialogs.dart';
import 'package:tm_front/utils/u_routes.dart';
import 'package:tm_front/utils/u_theme.dart';

class SRP4Sys extends StatefulWidget {
  const SRP4Sys({Key? key}) : super(key: key);

  @override
  _SRP4SysState createState() => _SRP4SysState();
}

class _SRP4SysState extends State<SRP4Sys> {
  final Map<UniqueKey, DoubleSelection> selections = {};
  final List<UniqueKey> systems = [];

  void addSystem() {
    setState(() {
      systems.insert(0, UniqueKey());
      selections[systems.first] = DoubleSelection.like;
    });
  }

  void removeSystem(UniqueKey key) {
    setState(() {
      systems.remove(key);
      selections.remove(key);
    });
  }

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
                    CHeader(title: 'JOGADOR'),
                    AppBoxes.rowVSeparator,
                    const CVPlayerIcon(),
                    AppBoxes.rowVSeparator,
                    CHeader(title: 'Sistemas de RPG'),
                    AppBoxes.bellowTitleVSeparator,
                    CJustBodyMedium(
                      text:
                          'Existem vários sistemas de RPG: conjuntos de regras que ajudam a organizar e balancear o jogo. Aqui você pode destacar os que você tem ou não interesse em jogar.',
                    ),
                    AppBoxes.textVSeparator,
                    CJustBodyMedium(
                      text:
                          'Sistemas que não são listados aqui são considerados de preferência neutra.',
                    ),
                    AppBoxes.setVSeparator,
                    // Informações de referência (ícones e legendas)
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.interactiveMainColor,
                        foregroundColor: AppColors.positiveColor,
                      ),
                      onPressed: addSystem,
                      child: Text("+ Adicionar Sistema"),
                    ),
                    // Espaço reservado para as caixas de seleção (Sistemas)
                    ...systems.map((key) => CGameSysBox(
                          key: key,
                          selection: selections[key]!,
                          onDelete: () => removeSystem(key),
                          onTitleChanged: (newTitle) {
                            // Aqui você pode atualizar o estado do modelo do sistema, se necessário.
                          },
                          onSelectionChanged: (selection) {
                            setState(() {
                              selections[key] = selection;
                            });
                            // Trate a seleção (como interesse ou não) para este sistema.
                          },
                        )),
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
          Navigator.of(context).pushNamed(URoutes.srp5Plat);
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
