import 'package:flutter/material.dart';

class CTwoColumnCheckboxes extends StatelessWidget {
  final List<bool> selectedTimes;
  final ValueChanged<List<bool>> onChanged;

  const CTwoColumnCheckboxes({
    Key? key,
    required this.selectedTimes,
    required this.onChanged,
  }) : super(key: key);

  Widget _buildCheckbox({required int index, required String label}) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: Colors.white, // Cor do ícone quando não selecionado
      ),
      child: CheckboxListTile(
        value: selectedTimes[index],
        onChanged: (bool? value) {
          // Cria uma nova lista atualizada e notifica o callback
          List<bool> newTimes = List.from(selectedTimes);
          newTimes[index] = value!;
          onChanged(newTimes);
        },
        title: Text(
          label,
          style: TextStyle(color: Colors.white), // Cor do texto
        ),
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        activeColor: Colors.white, // Cor do ícone quando selecionado
        checkColor: Colors.black, // Cor da marca de seleção
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Primeira coluna (horários de 00:00 a 11:00)
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(12, (index) {
              final hour = index.toString().padLeft(2, '0');
              return _buildCheckbox(index: index, label: '$hour:00');
            }),
          ),
        ),
        const SizedBox(width: 16),
        // Segunda coluna (horários de 12:00 a 23:00)
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(12, (index) {
              final hour = (index + 12).toString().padLeft(2, '0');
              return _buildCheckbox(index: index + 12, label: '$hour:00');
            }),
          ),
        ),
      ],
    );
  }
}
