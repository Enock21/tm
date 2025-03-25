// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tm_front/components/c_buttons.dart';
// import 'package:tm_front/routes/app_routes.dart';
// import 'package:tm_front/utils/u_theme.dart'; // Importa o TMButton

// class SRP2Intro extends StatelessWidget {

//   const SRP2Intro({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       // O conteúdo que pode rolar fica no body:
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
//             child: Center(
//               child: ConstrainedBox(
//                 constraints: const BoxConstraints(maxWidth: 390),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // Title text
//                     RichText(
//                       textAlign: TextAlign.center,
//                       text: const TextSpan(
//                         style: TextStyle(
//                           color: AppColors.nonInteractiveMainColor,
//                           fontFamily: 'Montserrat',
//                           fontSize: 20,
//                           height: 1.5,
//                         ),
//                         children: [
//                           TextSpan(
//                             text:
//                                 'Você deseja participar da Taverna Multiversal como ',
//                             style: TextStyle(fontWeight: FontWeight.w400),
//                           ),
//                           TextSpan(
//                             text: 'Jogador',
//                             style: TextStyle(fontWeight: FontWeight.w700),
//                           ),
//                           TextSpan(
//                             text: '?',
//                             style: TextStyle(fontWeight: FontWeight.w400),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 48),
                    
//                     SvgPicture.asset(
//                       'assets/icons/game-icons--dice-twenty-faces-twenty.svg',
//                       width: 63,
//                       height: 63,
//                       colorFilter: ColorFilter.mode(AppColors.nonInteractiveMainColor, BlendMode.srcIn),
//                     ),
//                     const SizedBox(height: 48),
                    
//                     // Description text
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         RichText(
//                           textAlign: TextAlign.justify,
//                           text: TextSpan(
//                             style: const TextStyle(
//                               color: AppColors.neutralColor,
//                               fontFamily: 'Montserrat',
//                               fontSize: 16,
//                               height: 1.5,
//                             ),
//                             children: const [
//                               TextSpan(text: 'Como um '),
//                               TextSpan(text: 'Jogador', style: TextStyle(fontWeight: FontWeight.w700)),
//                               TextSpan(text: ', você pode se inscrever para '),
//                               TextSpan(text: 'jogar', style: TextStyle(fontWeight: FontWeight.w700)),
//                               TextSpan(
//                                   text:
//                                       ' em RPGs, participar de grupos de Jogadores, criar propostas de jogos para Mestres narrarem e exibir suas preferências como '),
//                               TextSpan(text: 'Jogador', style: TextStyle(fontWeight: FontWeight.w700)),
//                               TextSpan(text: '.'),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 15), // Espaço entre os parágrafos
//                         RichText(
//                           textAlign: TextAlign.justify,
//                           text: TextSpan(
//                             style: const TextStyle(
//                               color: AppColors.neutralColor,
//                               fontFamily: 'Montserrat',
//                               fontSize: 16,
//                               height: 1.5,
//                             ),
//                             children: const [
//                               TextSpan(
//                                   text:
//                                       'Para aproveitar o máximo que a Taverna Multiversal tem para te oferecer, é recomendado que você personalize seu perfil de '),
//                               TextSpan(text: 'Jogador', style: TextStyle(fontWeight: FontWeight.w700)),
//                               TextSpan(
//                                   text:
//                                       ' com algumas informações. Isso vai te ajudar a encontrar RPGs e RPGistas adequados aos seus gostos como '),
//                               TextSpan(text: 'Jogador', style: TextStyle(fontWeight: FontWeight.w700)),
//                               TextSpan(text: '.'),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         RichText(
//                           textAlign: TextAlign.justify,
//                           text: const TextSpan(
//                             style: TextStyle(
//                               color: AppColors.neutralColor,
//                               fontFamily: 'Montserrat',
//                               fontSize: 16,
//                               height: 1.5,
//                             ),
//                             children: [
//                               TextSpan(
//                                   text:
//                                       'Esta escolha pode ser alterada a qualquer momento através do seu perfil.'),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),

//                     const SizedBox(height: 80),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       // Rodapé fixo com os botões:
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
//         child: Row(
//           children: [
//             Expanded(
//               child: SizedBox(
//                 height: 42,
//                 child: TMButton.negative(
//                   text: 'NÃO!',
//                   onPressed: onDecline ?? () {
//                     //TODO: variável que indica interesse em ser jogador fica false
//                     Navigator.pushNamed(context, AppRoutes.srgm1Choice);
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: SizedBox(
//                 height: 42,
//                 child: TMButton.positive(
//                   text: 'SIM!',
//                   onPressed: onConfirm ?? () {
//                     //TODO: variável que indica interesse em ser jogador fica true
//                     Navigator.pushNamed(context, AppRoutes.srgm1Choice);
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
