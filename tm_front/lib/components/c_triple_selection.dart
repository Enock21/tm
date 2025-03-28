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

  // Constrói cada botão de ícone com destaque quando selecionado.
  Widget _buildIcon(TripleSelection type, IconData iconData) {
    final bool isSelected = _selected == type;
    return GestureDetector(
      onTap: () => _select(type),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.interactiveMainColor : Colors.grey[300],
          border: isSelected ? Border.all(color: AppColors.neutralColor, width: 3) : null,
        ),
        child: Icon(
          iconData,
          color: isSelected ? Colors.white : Colors.black,
          size: 36,
        ),
      ),
    );
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
