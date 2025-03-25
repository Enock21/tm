import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tm_front/components/c_bottom_butt.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/components/c_header.dart';
import 'package:tm_front/routes/app_routes.dart';
import 'package:tm_front/utils/u_theme.dart'; // Importa o TMButton

class SRP1Choice extends StatelessWidget {
  final VoidCallback? onConfirm;
  final VoidCallback? onDecline;

  const SRP1Choice({
    Key? key,
    this.onConfirm,
    this.onDecline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // Conteúdo rolável no body:
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
                    const CHeader(title: 'Você deseja participar da Taverna Multiversal como Jogador?'),
                    const SizedBox(height: 48),
                    SvgPicture.asset(
                      'assets/icons/game-icons--dice-twenty-faces-twenty.svg',
                      width: 63,
                      height: 63,
                      colorFilter: ColorFilter.mode(
                          AppColors.nonInteractiveMainColor, BlendMode.srcIn),
                    ),
                    const SizedBox(height: 48),
                    // Texto descritivo
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: AppTexts.bodyMedium,
                            children: [
                              const TextSpan(text: 'Como um '),
                              TextSpan(
                                  text: 'jogador',
                                  style: AppTexts.bodyMediumBold),
                              const TextSpan(
                                  text:
                                      ', você pode se inscrever para '),
                              TextSpan(
                                  text: 'jogar',
                                  style: AppTexts.bodyMediumBold),
                              const TextSpan(
                                  text:
                                      ' em RPGs, participar de grupos de jogadores, criar propostas de jogos para mestres narrarem e exibir suas preferências como '),
                              TextSpan(
                                  text: 'jogador',
                                  style: AppTexts.bodyMediumBold),
                              const TextSpan(text: '.'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15), // Espaço entre os parágrafos
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: AppTexts.bodyMedium,
                            children: [
                              const TextSpan(
                                  text:
                                      'Para aproveitar o máximo que a Taverna Multiversal tem para te oferecer, é recomendado que você personalize seu perfil de '),
                              TextSpan(
                                  text: 'jogador',
                                  style: AppTexts.bodyMediumBold),
                              const TextSpan(
                                  text:
                                      ' com algumas informações. Isso vai te ajudar a encontrar RPGs e RPGistas adequados aos seus gostos como '),
                              TextSpan(
                                  text: 'jogador',
                                  style: AppTexts.bodyMediumBold),
                              const TextSpan(text: '.'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: AppTexts.bodyMedium,
                            children: const [
                              TextSpan(
                                  text:
                                      'Esta escolha pode ser alterada a qualquer momento através do seu perfil.'),
                            ],
                          ),
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
        positiveText: 'SIM',
        negativeText: 'NÃO',
        onConfirm: onConfirm ??
            () {
              //TODO: variável que indica se o user quer ser player fica true
              Navigator.pushNamed(context, AppRoutes.srgm1Choice);
            },
        onDecline: onDecline ??
            () {
              //TODO: variável que indica se o user quer ser player fica false
              Navigator.pushNamed(context, AppRoutes.srgm1Choice);
            },
      ),
    );
  }
}
