import 'package:flutter/material.dart';
import 'package:tm_front/components/c_double_selection.dart';
import 'package:tm_front/components/input/text/cit_generic.dart';
import 'package:tm_front/utils/u_theme.dart';

class CGameSysBox extends StatefulWidget {
  final DoubleSelection selection;
  final VoidCallback onDelete;
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<DoubleSelection> onSelectionChanged;

  const CGameSysBox({
    Key? key,
    this.selection = DoubleSelection.like,
    required this.onDelete,
    required this.onTitleChanged,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _CGameSysBoxState createState() => _CGameSysBoxState();
}

class _CGameSysBoxState extends State<CGameSysBox> {
  bool isEditing = false;
  String title = "Novo Sistema";
  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = title;
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  void toggleEdit() {
    if (isEditing) {
      // Salva o novo título e sai do modo de edição.
      setState(() {
        title = titleController.text;
        isEditing = false;
      });
      widget.onTitleChanged(title);
    } else {
      setState(() {
        isEditing = true;
      });
    }
  }

  Future<void> confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirmar Deleção", textAlign: TextAlign.center),
        content: Text("Deseja realmente excluir este sistema?", textAlign: TextAlign.left),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text("Cancelar"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text("Confirmar"),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      widget.onDelete();
    }
  }

  @override
  Widget build(BuildContext context) {
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
          // Cabeçalho com botão de deletar, título e botão de edição.
          Row(
            children: [
              // Botão de deletar (ícone de lixeira)
              IconButton(
                icon: Icon(Icons.delete, color: AppColors.negativeColor),
                onPressed: confirmDelete,
              ),
              Expanded(
                child: Center(
                  child: isEditing
                      ? CITGeneric(
                          controller: titleController,
                          hintText: "Nome do sistema",
                          onChanged: (val) {},
                        )
                      : Text(
                          title,
                          style: AppTexts.headlineMedium.copyWith(
                            color: widget.selection == DoubleSelection.like
                              ? AppColors.nonInteractiveGreen
                              : AppColors.nonInteractiveRed,
                          ),
                          textAlign: TextAlign.center,
                        ),
                ),
              ),
              // Botão de edição / confirmação
              IconButton(
                icon: isEditing
                    ? Icon(Icons.check, color: AppColors.interactiveSecondColor)
                    : Icon(Icons.edit, color: AppColors.interactiveSecondColor),
                onPressed: toggleEdit,
              ),
            ],
          ),
          // Espaço inferior com o widget CDoubleSelection.
          CDoubleSelection(
            initialSelection: widget.selection,
            onChanged: widget.onSelectionChanged,
          ),
        ],
      ),
    );
  }
}
