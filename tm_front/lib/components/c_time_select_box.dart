import 'package:flutter/material.dart';
import 'package:tm_front/components/c_two_column_checkboxes.dart';
import 'package:tm_front/components/input/text/cit_generic.dart';
import 'package:tm_front/components/input/text/cit_long.dart';
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

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 49, 49, 49),
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
          Offstage(
            offstage: !_isExpanded,
            child: Column(
              children: [
                // Linha com os botões "Desmarcar Todos" e "Marcar Todos"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _deselectAll,
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.negativeAreaColor),
                          child: const Text(
                            'Desmarcar Todos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.negativeColor
                            )
                          ),  
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _selectAll,
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.interactiveMainColor),
                          child: const Text(
                            'Marcar Todos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.positiveColor
                            )
                          ),  
                        ),
                      ),
                    ],
                  ),
                ),
                // Duas colunas de checkboxes (com estado controlado)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 8),
                  child: Center( // Adicione este widget
                    child: CTwoColumnCheckboxes(
                      selectedTimes: _selectedTimes,
                      onChanged: (newTimes) {
                        setState(() {
                          _selectedTimes = newTimes;
                        });
                        widget.onTimeSelectionChanged?.call(_selectedTimes);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: CITLong(
                    hintText: 'Observações sobre o dia',
                    onChanged: (widget.onNoteChanged),//TODO: atribuir lógica se necessario
                  ),
                ),
              ],
            ),
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
