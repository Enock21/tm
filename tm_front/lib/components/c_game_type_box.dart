import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tm_front/utils/u_theme.dart';
import 'package:tm_front/components/c_triple_selection.dart';

class CGameTypeBox extends StatefulWidget {
  final String title;
  final Widget? leadingIcon;
  final String description;
  final TripleSelection initialSelection;
  final ValueChanged<TripleSelection> onChanged;
  final String? iconAsset;

  const CGameTypeBox({
    Key? key,
    required this.title,
    this.leadingIcon,
    required this.description,
    this.initialSelection = TripleSelection.neutral,
    required this.onChanged,
    this.iconAsset,
  }) : super(key: key);

  @override
  _CGameTypeBoxState createState() => _CGameTypeBoxState();
}

class _CGameTypeBoxState extends State<CGameTypeBox>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _arrowAnimation;
  late TripleSelection _selection;

  @override
  void initState() {
    super.initState();
    _selection = widget.initialSelection;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _arrowAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(_controller);
  }

  Color _getColorForSelection(TripleSelection selection) {
    switch (selection) {
      case TripleSelection.like:
        return AppColors.nonInteractiveGreen;
      case TripleSelection.dislike:
        return AppColors.nonInteractiveRed;
      default:
        return AppColors.neutralColor;
    }
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
    final currentColor = _getColorForSelection(_selection);

    return Container(
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
                  width: 30.0,
                  height: 30.0,
                  child: widget.iconAsset != null
                      ? SvgPicture.asset(widget.iconAsset!,
                          width: 30,
                          height: 30,
                          colorFilter:
                              ColorFilter.mode(currentColor, BlendMode.srcIn))
                      : const SizedBox(
                          width: 30.0,
                          height: 30.0,
                        ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.title,
                    style:
                        AppTexts.headlineMedium.copyWith(color: currentColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: RotationTransition(
                    turns: _arrowAnimation,
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 35,
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
            initialSelection: TripleSelection.neutral,
            onChanged: (newSelection) {
              setState(() {
                _selection = newSelection;
              });
              widget.onChanged(newSelection);
            },
          ),
        ],
      ),
    );
  }
}
