import 'package:flutter/material.dart';
import 'package:tm_front/components/c_buttons.dart';
import 'package:tm_front/utils/u_routes.dart';
import 'package:tm_front/utils/u_theme.dart';

class CBottomButt extends StatelessWidget {
  final String positiveText;
  final String negativeText;
  final VoidCallback? onConfirm;
  final VoidCallback? onDecline;

  const CBottomButt({
    Key? key,
    required this.positiveText,
    required this.negativeText,
    this.onConfirm,
    this.onDecline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 42,
              child: TMButton.negative(
                text: negativeText,
                onPressed: onDecline ??
                    () {
                      // Exemplo de ação padrão para o botão negativo
                      Navigator.pushNamed(context, URoutes.srgm1Choice);
                    },
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 42,
              child: TMButton.positive(
                text: positiveText,
                onPressed: onConfirm ??
                    () {
                      // Exemplo de ação padrão para o botão positivo
                      Navigator.pushNamed(context, URoutes.srgm1Choice);
                    },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
