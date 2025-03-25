import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/routes/app_routes.dart';
import 'package:tm_front/utils/u_theme.dart'; // Importa o TMButton

class SRGM1Choice extends StatelessWidget {
  final VoidCallback? onConfirm;
  final VoidCallback? onDecline;

  const SRGM1Choice({
    Key? key,
    this.onConfirm,
    this.onDecline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // O conteúdo que pode rolar fica no body:
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
                    // Title text
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: AppTexts.headlineMedium,
                        children: [
                          TextSpan(
                            text:
                                'Você deseja participar da Taverna Multiversal como ',
                          ),
                          TextSpan(
                            text: 'Mestre?',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                    
                    SvgPicture.asset(
                      'assets/icons/book-opened-svgrepo-com.svg',
                      width: 63,
                      height: 63,
                      colorFilter: ColorFilter.mode(AppColors.nonInteractiveMainColor, BlendMode.srcIn),
                    ),
                    const SizedBox(height: 48),
                    
                    // Description text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: AppTexts.bodyMedium,
                            children: [
                              TextSpan(text: 'Como um '),
                              TextSpan(text: 'mestre', style: AppTexts.bodyMediumBold),
                              TextSpan(text: ', você pode criar e organizar RPGs, recrutar jogadores para seus jogos, aceitar mestrar propostas de RPGs de outros jogadores ou mestres, convidar outros mestres para uma mestragem colaborativa e exibir suas preferências como '),
                              TextSpan(text: 'mestre', style: AppTexts.bodyMediumBold),
                              TextSpan(text: '.'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15), // Espaço entre os parágrafos
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: const TextStyle(
                              color: AppColors.neutralColor,
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              height: 1.5,
                            ),
                            children: [
                              TextSpan(text: 'Para aproveitar o máximo que a Taverna Multiversal tem para te oferecer, é recomendado que você personalize seu perfil de '),
                              TextSpan(text: 'mestre', style: AppTexts.bodyMediumBold),
                              TextSpan(text: ' com algumas informações. Isso vai te ajudar a encontrar RPGs e RPGistas adequados aos seus gostos como '),
                              TextSpan(text: 'mestre', style: AppTexts.bodyMediumBold),
                              TextSpan(text: '.'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: const TextSpan(
                            style: TextStyle(
                              color: AppColors.neutralColor,
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              height: 1.5,
                            ),
                            children: [
                              TextSpan(text: 'Esta escolha pode ser alterada a qualquer momento através do seu perfil.'),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 42,
                child: TMButton.negative(
                  text: 'NÃO',
                  onPressed: onDecline ?? () {
                    //TODO: variável que indica interesse em ser mestre fica false
                    Navigator.pushNamed(context, AppRoutes.srp2Intro);
                  },
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 42,
                child: TMButton.positive(
                  text: 'SIM',
                  onPressed: onConfirm ?? () {
                    //TODO: variável que indica interesse em ser mestre fica true
                    Navigator.pushNamed(context, AppRoutes.srp2Intro);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}