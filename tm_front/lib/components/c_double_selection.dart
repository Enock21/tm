import 'package:flutter/material.dart';
import 'package:tm_front/utils/u_theme.dart';

enum DoubleSelection { dislike, like }

class CDoubleSelection extends StatefulWidget {
  final DoubleSelection? initialSelection;
  final ValueChanged<DoubleSelection> onChanged;

  const CDoubleSelection({
    Key? key,
    this.initialSelection,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CDoubleSelectionState createState() => _CDoubleSelectionState();
}

class _CDoubleSelectionState extends State<CDoubleSelection> {
  DoubleSelection? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialSelection;
  }

  void _select(DoubleSelection selection) {
    setState(() {
      _selected = selection;
    });
    widget.onChanged(selection);
  }

  // Constrói cada botão de ícone com destaque quando selecionado.
  Widget _buildIcon(DoubleSelection type, IconData iconData) {
    final bool isSelected = _selected == type;
    return GestureDetector(
      onTap: () => _select(type),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.interactiveMainColor : Colors.grey[300],
          border: isSelected
              ? Border.all(color: AppColors.neutralColor, width: 3)
              : null,
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
        _buildIcon(DoubleSelection.dislike, Icons.thumb_down),
        const SizedBox(width: 16),
        _buildIcon(DoubleSelection.like, Icons.thumb_up),
      ],
    );
  }
}
