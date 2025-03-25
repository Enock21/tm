import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tm_front/components/c_buttons.dart';

class SRP2Intro extends StatelessWidget {
  const SRP2Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final screenSize = MediaQuery.of(context).size;
    //final isSmallScreen = screenSize.width <= 640;

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Stack(
          children: [
            // Back Button
            Positioned(
              top: 20,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.string(
                  '''<svg width="53" height="44" viewBox="0 0 53 44" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M17.2802 23.8333L29.6469 34.1L26.5 36.6667L8.83333 22L26.5 7.33334L29.6469 9.90001L17.2802 20.1667H44.1667V23.8333H17.2802Z" fill="#7B0AAF"/>
                  </svg>''',
                  width: 53,
                  height: 44,
                ),
              ),
            ),

            // Main Content
            Column(
              children: [
                // Header Section
                Column(
                  children: [
                    const SizedBox(height: 21),
                    Text(
                      'JOGADOR',
                      style: GoogleFonts.montserrat(
                        color: const Color(0xFFBB86FC),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 27),
                    SvgPicture.string(
                      '''<svg width="63" height="63" viewBox="0 0 63 63" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M1.125 5.625C1.125 3.13972 3.13972 1.125 5.625 1.125H34.59C37.0753 1.125 39.09 3.13972 39.09 5.625V18.2851H28.4101C22.8182 18.2851 18.2851 22.8182 18.2851 28.4101V39.09H5.625C3.13972 39.09 1.125 37.0753 1.125 34.59V5.625ZM12.6066 16.8691C12.5526 16.8717 12.4983 16.8729 12.4438 16.8729C9.92597 16.8729 7.8849 14.8319 7.8849 12.3141L7.88499 12.2843L7.8849 12.2547C7.8849 9.76941 9.89959 7.75472 12.3849 7.75472L12.4464 7.75413C14.9642 7.75413 17.0053 9.79519 17.0053 12.313C17.0053 14.7772 15.0502 16.7847 12.6066 16.8691ZM28.4101 23.9101C25.9248 23.9101 23.9101 25.9248 23.9101 28.4101V57.375C23.9101 59.8603 25.9248 61.875 28.4101 61.875H57.375C59.8603 61.875 61.875 59.8603 61.875 57.375V28.4101C61.875 25.9248 59.8603 23.9101 57.375 23.9101H28.4101ZM48.9668 40.372C51.4521 40.372 53.4668 38.3573 53.4668 35.872C53.4668 33.3867 51.4521 31.372 48.9668 31.372C46.4814 31.372 44.4666 33.3867 44.4666 35.872C44.4666 38.3573 46.4814 40.372 48.9668 40.372ZM41.3182 49.9131C41.3182 52.3985 39.3035 54.4131 36.8182 54.4131C34.3329 54.4131 32.3182 52.3985 32.3182 49.9131C32.3182 47.4277 34.3329 45.4131 36.8182 45.4131C39.3035 45.4131 41.3182 47.4277 41.3182 49.9131Z" fill="#BB86FC"/>
                      </svg>''',
                      width: 63,
                      height: 63,
                    ),
                    const SizedBox(height: 19),
                    Text(
                      'Pronto para Começar?',
                      style: GoogleFonts.montserrat(
                        color: const Color(0xFFBB86FC),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                // Instruction Text
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 43, 28, 0),
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      children: const [
                        TextSpan(
                          text: 'Preencha as informações seguintes para personalizar seu perfil de ',
                        ),
                        TextSpan(
                          text: 'jogador',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: '.'),
                        TextSpan(text: '\n\n'),
                        TextSpan(
                          text: 'Todos os campos a seguir são opcionais e você pode alterá-los depois.',
                        ),
                        TextSpan(text: '\n\n'),
                        TextSpan(
                          text: 'Caso deseje interromper a personalização do seu perfil de ',
                        ),
                        TextSpan(
                          text: 'jogador',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ', você pode selecionar "Pular Tudo" a qualquer momento. Se fizer isso, o que já foi preenchido ficará salvo no seu perfil.',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Bottom Buttons
            Positioned(
              bottom: 26,
              //left: isSmallScreen ? 27 : 17,
              //right: isSmallScreen ? 27 : 17,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TMButton.negative(
                    text: 'Pular Tudo',
                    onPressed: () {
                      // Handle skip action
                    },
                  ),
                  TMButton.positive(
                    text: 'Continuar',
                    onPressed: () {
                      // Handle continue action
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
