import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tm_front/components/c_buttons.dart'; // Importa o TMButton

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
      backgroundColor: const Color(0xFF1A1A1A),
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
                      text: const TextSpan(
                        style: TextStyle(
                          color: Color(0xFFBB86FC),
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Você deseja participar da Taverna Multiversal como ',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: 'Jogador',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: '?',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                    
                    // Dice SVG Icon
                    SvgPicture.string(
                      '''<svg width="63" height="63" viewBox="0 0 63 63" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M1.125 5.625C1.125 3.13972 3.13972 1.125 5.625 1.125H34.59C37.0753 1.125 39.09 3.13972 39.09 5.625V18.2851H28.4101C22.8182 18.2851 18.2851 22.8182 18.2851 28.4101V39.09H5.625C3.13972 39.09 1.125 37.0753 1.125 34.59V5.625ZM12.6066 16.8691C12.5526 16.8717 12.4983 16.8729 12.4438 16.8729C9.92597 16.8729 7.8849 14.8319 7.8849 12.3141L7.88499 12.2843L7.8849 12.2547C7.8849 9.76941 9.89959 7.75472 12.3849 7.75472L12.4464 7.75413C14.9642 7.75413 17.0053 9.79519 17.0053 12.313C17.0053 14.7772 15.0502 16.7847 12.6066 16.8691ZM28.4101 23.9101C25.9248 23.9101 23.9101 25.9248 23.9101 28.4101V57.375C23.9101 59.8603 25.9248 61.875 28.4101 61.875H57.375C59.8603 61.875 61.875 59.8603 61.875 57.375V28.4101C61.875 25.9248 59.8603 23.9101 57.375 23.9101H28.4101ZM48.9668 40.372C51.4521 40.372 53.4668 38.3573 53.4668 35.872C53.4668 33.3867 51.4521 31.372 48.9668 31.372C46.4814 31.372 44.4666 33.3867 44.4666 35.872C44.4666 38.3573 46.4814 40.372 48.9668 40.372ZM41.3182 49.9131C41.3182 52.3985 39.3035 54.4131 36.8182 54.4131C34.3329 54.4131 32.3182 52.3985 32.3182 49.9131C32.3182 47.4277 34.3329 45.4131 36.8182 45.4131C39.3035 45.4131 41.3182 47.4277 41.3182 49.9131Z" fill="#BB86FC"/>
                      </svg>''',
                      width: 63,
                      height: 63,
                    ),
                    const SizedBox(height: 48),
                    
                    // Description text
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: 'Como um ',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: 'Jogador',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: ', você pode se inscrever para ',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: 'jogar',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text:
                                ' em RPGs, participar de grupos de Jogadores, criar propostas de jogos para Mestres narrarem e exibir suas preferências como ',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: 'Jogador',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text:
                                '. Para aproveitar o máximo que a Taverna Multiversal tem para te oferecer, é recomendado que você personalize seu perfil de ',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: 'Jogador',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text:
                                ' com algumas informações. Isso vai te ajudar a encontrar RPGs e RPGistas adequados aos seus gostos como ',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: 'Jogador',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text:
                                '. Esta escolha pode ser alterada a qualquer momento através do seu perfil.',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80),
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
                  text: 'NÃO!',
                  onPressed: onDecline ?? () {},
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 42,
                child: TMButton.positive(
                  text: 'SIM!',
                  onPressed: onConfirm ?? () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
