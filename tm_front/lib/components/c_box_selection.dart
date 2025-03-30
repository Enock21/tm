import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tm_front/utils/u_theme.dart';
import 'package:tm_front/components/c_triple_selection.dart';

class CBoxSelection extends StatefulWidget {
  final String title;
  final Widget? leadingIcon;
  final String description;
  final Selection initialSelection;
  final ValueChanged<Selection> onChanged;
  final String? iconAsset;

  const CBoxSelection({
    Key? key,
    required this.title,
    this.leadingIcon,
    required this.description,
    this.initialSelection = Selection.neutral,
    required this.onChanged,
    this.iconAsset,
  }) : super(key: key);

  @override
  _CBoxSelectionState createState() => _CBoxSelectionState();
}

class _CBoxSelectionState extends State<CBoxSelection>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _arrowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _arrowAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(_controller);
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Formato de retângulo com borda e fundo personalizado
      decoration: BoxDecoration(
        color: AppColors.boxColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.neutralColor, width: 2),
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Parte superior: Título, ícone à esquerda e seta à direita
          GestureDetector(
            onTap: _toggleExpansion,
            child: Row(
              children: [
                SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: widget.iconAsset != null
                  ? SvgPicture.asset(
                    widget.iconAsset!,
                    width: 24,
                    height: 24,
                    color: AppColors.nonInteractiveGreen
                  )
                  :
                  const SizedBox(
                    width: 24.0, // Mesma largura do ícone
                    height: 24.0, // Mesma altura do ícone
                  ),
                ),
                const SizedBox(width: 8), // Espaçamento entre o ícone e o título
                Expanded(
                  child: Text(
                    widget.title,
                    style: AppTexts.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 8), // Espaçamento entre o título e a seta
                SizedBox(
                  width: 24.0, // Largura fixa para a seta
                  height: 24.0, // Altura fixa para a seta
                  child: RotationTransition(
                    turns: _arrowAnimation,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.interactiveSecondColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Parte intermediária: descrição (oculta por padrão)
          if (_isExpanded) ...[
            const SizedBox(height: 8),
            Align(
              child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                      style: AppTexts.bodyMedium, text: widget.description)),
            ),
          ],
          const SizedBox(height: 8),
          // Parte inferior: CTripleSelection
          CTripleSelection(
            onChanged: widget.onChanged,
            initialSelection: Selection.neutral,
          ),
        ],
      ),
    );
  }
}
