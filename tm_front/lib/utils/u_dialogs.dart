import 'package:flutter/material.dart';

Future<bool> confirmOperation({
  required BuildContext context,
  String title = 'Confirmação',
  String content = 'Tem certeza de que deseja continuar?',
  String cancelText = 'Cancelar',
  String confirmText = 'Confirmar',
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title, textAlign: TextAlign.center),
        content: Text(content, textAlign: TextAlign.left),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelText),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(confirmText),
          ),
        ],
      );
    },
  );
  return result ?? false;
}

Future<bool> skipAllRegistrationScreens(BuildContext context) async {
  return confirmOperation(
    context: context,
    title: 'Confirmação',
    content: 'Tem certeza de que deseja pular todas as etapas deste cadastro?',
    cancelText: 'Não',
    confirmText: 'Sim',
  );
}

Future<bool> confirmDelete(BuildContext context) async {
  return confirmOperation(
    context: context,
    title: 'Confirmar Deleção',
    content: 'Deseja realmente excluir este sistema?',
    cancelText: 'Não',
    confirmText: 'Sim',
  );
}

Future<bool> confirmBackToLogin(BuildContext context) async {
  return confirmOperation(
    context: context,
    title: 'Confirmar Saída',
    content: 'Deseja realmente sair e retornar à tela de login?',
    cancelText: 'Não',
    confirmText: 'Sim',
  );
}

Future<bool> confirmBackFromSRUProf(BuildContext context) async {
  return confirmOperation(
    context: context,
    title: 'Confirmar Saída',
    content: 'Os dados preenchidos serão perdidos. Deseja realmente sair e retornar à tela de login?',
    cancelText: 'Cancelar',
    confirmText: 'Confirmar',
  );
}