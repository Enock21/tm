import 'package:flutter/material.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/utils/u_theme.dart';

class CHeader extends StatelessWidget {
  final String? title;
  final VoidCallback? onBack;
  final bool showBackButton;

  const CHeader({
    this.title,
    this.onBack,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool canPop = Navigator.of(context).canPop();

    return Row(children: [
      if (canPop && showBackButton) ...{
        TMBackButton(
          onPressed: onBack ?? () => Navigator.of(context).maybePop(),
        ),
      } else ...{
        const SizedBox(width: 40),
      },
      AppBoxes.smallHBox,
      Expanded(
        child: Text(
          title ?? '',
          style: AppTexts.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
      if (canPop) const SizedBox(width: 48)
    ]);
  }
  /*
    Para definir a rota do botão de retorno na referencia do CHeader:
    CHeader(
      title: 'Título',
      onBack: () => Navigator.pushNamed(context, '/rota-personalizada'),
    ),
  */
}
