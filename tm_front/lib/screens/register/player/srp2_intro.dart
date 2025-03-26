import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tm_front/components/c_bottom_butt.dart';
import 'package:tm_front/components/c_header.dart';
import 'package:tm_front/components/visual/cv_player_icon.dart';
import 'package:tm_front/utils/u_theme.dart';

class SRP2Intro extends StatelessWidget {
  const SRP2Intro({Key? key}) : super(key: key);

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
                    const SizedBox(height: 20),
                    const CVPlayerIcon(),
                    const SizedBox(height: 20),
                    CHeader(title: 'Pronto para Começar?'),
                    
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
          // Ação para o botão "Continuar"
        },
        onDecline: () {
          // Ação para o botão "Pular Tudo"
        },
      ),
    );
  }
}
