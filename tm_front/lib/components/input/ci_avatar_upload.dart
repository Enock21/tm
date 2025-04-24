import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tm_front/utils/u_theme.dart';

class CIAvatarUpload extends StatelessWidget {
  final VoidCallback? onTap;

  const CIAvatarUpload({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // <- Implementar lógica para seleção/upload da imagem
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.nonInteractiveMainColor,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.boxColor,
              child: Icon(
                Icons.person,
                size: 50,
                color: AppColors.nonInteractiveGreen,
              ),
            ),
            Positioned(
              bottom: 4,
              child: SvgPicture.asset(
                'assets/icons/editButt.svg',
                width: 25,
                height: 25
              )
            )
          ],
        ),
      ),
    );
  }
}
