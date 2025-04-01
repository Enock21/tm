import 'package:flutter/material.dart';
import 'package:tm_front/utils/u_theme.dart';

enum TripleSelection { dislike, neutral, like }

class CTripleSelection extends StatefulWidget {
  final TripleSelection? initialSelection;
  final ValueChanged<TripleSelection> onChanged;

  const CTripleSelection({
    Key? key,
    this.initialSelection,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CTripleSelectionState createState() => _CTripleSelectionState();
}

class _CTripleSelectionState extends State<CTripleSelection> {
  TripleSelection? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialSelection;
  }

  void _select(TripleSelection selection) {
    setState(() {
      _selected = selection;
    });
    widget.onChanged(selection);
  }

  Widget _buildIcon(TripleSelection type, IconData iconData) {
  final bool isSelected = _selected == type;
  if (isSelected) {
    Color bgColor;
    Color borderColor;
    Color iconColor;
    switch (type) {
      case TripleSelection.neutral:
        bgColor = AppColors.neutralColor;
        borderColor = Colors.black;
        iconColor = Colors.black;
        break;
      case TripleSelection.dislike:
        bgColor = AppColors.nonInteractiveSecondColor;
        borderColor = AppColors.nonInteractiveRed;
        iconColor = AppColors.nonInteractiveRed;
        break;
      case TripleSelection.like:
        bgColor = AppColors.nonInteractiveMainColor;
        borderColor = AppColors.nonInteractiveGreen;
        iconColor = AppColors.nonInteractiveGreen;
        break;
    }
    return GestureDetector(
      onTap: () => _select(type),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
          border: Border.all(color: borderColor, width: 5),
        ),
        child: Icon(
          iconData,
          color: iconColor,
          size: 36,
        ),
      ),
    );
  } else {
    // Caso não esteja selecionado, exibe o ícone com a cor padrão
    return GestureDetector(
      onTap: () => _select(type),
      child: Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        child: Icon(
          iconData,
          color: AppColors.neutralColor,
          size: 36,
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // Organiza os três botões em uma linha, com espaçamento entre eles.
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIcon(TripleSelection.dislike, Icons.thumb_down),
        const SizedBox(width: 16),
        _buildIcon(TripleSelection.neutral, Icons.sentiment_neutral),
        const SizedBox(width: 16),
        _buildIcon(TripleSelection.like, Icons.thumb_up),
      ],
    );
  }
}
