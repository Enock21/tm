import 'package:flutter/material.dart';
import 'package:tm_front/components/input/text/cit_generic.dart';
import 'package:tm_front/utils/u_theme.dart';

class CTimeSelectBox extends StatefulWidget {
  final String title;
  final ValueChanged<List<bool>>? onTimeSelectionChanged;
  final ValueChanged<String>? onNoteChanged;

  const CTimeSelectBox({
    Key? key,
    required this.title,
    this.onTimeSelectionChanged,
    this.onNoteChanged,
  }) : super(key: key);

  @override
  _CTimeSelectBoxState createState() => _CTimeSelectBoxState();
}

class _CTimeSelectBoxState extends State<CTimeSelectBox> {
  bool _isExpanded = false;
  // Vetor de 24 posições, representando cada hora do dia.
  List<bool> _selectedTimes = List.filled(24, false);

  // Alterna entre expandido e colapsado.
  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  // Marca todas as checkboxes.
  void _selectAll() {
    setState(() {
      _selectedTimes = List.filled(24, true);
    });
    widget.onTimeSelectionChanged?.call(_selectedTimes);
  }

  // Desmarca todas as checkboxes.
  void _deselectAll() {
    setState(() {
      _selectedTimes = List.filled(24, false);
    });
    widget.onTimeSelectionChanged?.call(_selectedTimes);
  }

  // Constrói o widget de cada checkbox com seu respectivo horário.
  Widget _buildTimeCheckbox(int hour) {
    final timeLabel = '${hour.toString().padLeft(2, '0')}:00';
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: _selectedTimes[hour],
          onChanged: (value) {
            setState(() {
              _selectedTimes[hour] = value ?? false;
            });
            widget.onTimeSelectionChanged?.call(_selectedTimes);
          },
        ),
        Text(timeLabel, style: AppTexts.bodyMedium),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 49, 49, 49),
      //color: AppColors.backgroundColor,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Cabeçalho com título (sem ícone)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: AppTexts.headlineMedium,
            ),
          ),
          // Conteúdo expansível
          if (_isExpanded)
            Column(
              children: [
                // Linha com os botões "Desmarcar Todos" e "Marcar Todos"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _deselectAll,
                          style: ElevatedButton.styleFrom(
                          ),
                          child: const Text('Desmarcar Todos'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _selectAll,
                          style: ElevatedButton.styleFrom(
                          ),
                          child: const Text('Marcar Todos'),
                        ),
                      ),
                    ],
                  ),
                ),
                // Duas colunas de checkboxes
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Coluna para horários de 00:00 a 11:00
                      Expanded(
                        child: Column(
                          children: List.generate(12, (index) => _buildTimeCheckbox(index)),
                        ),
                      ),
                      // Coluna para horários de 12:00 a 23:00
                      Expanded(
                        child: Column(
                          children: List.generate(12, (index) => _buildTimeCheckbox(index + 12)),
                        ),
                      ),
                    ],
                  ),
                ),
                // Campo de observações usando CITGeneric
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: CITGeneric(//TODO: precisa de um input para parágrafo longo
                    hintText: 'Observações sobre o dia',
                    onChanged: widget.onNoteChanged,
                  ),
                ),
              ],
            ),
          // Seta para expandir/colapsar, centralizada na parte inferior
          GestureDetector(
            onTap: _toggleExpansion,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Icon(
                _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                size: 36,
                color: AppColors.interactiveSecondColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
