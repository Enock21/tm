import 'package:flutter/material.dart';
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
            // Ícone de upload posicionado na parte inferior do círculo
            Positioned(
              bottom: 4,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.interactiveSecondColor,
                child: const Icon(
                  Icons.file_upload,
                  size: 18,
                  color: AppColors.nonInteractiveGreen,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
