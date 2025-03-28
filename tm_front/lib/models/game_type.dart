import 'package:flutter/material.dart';

class GameType {
  final String title;
  final String description;
  final IconData? icon;

  GameType({
    required this.title,
    required this.description,
    required this.icon,
  });
}

final List<GameType> gameTypes = [
  GameType(
    title: 'Ação',
    description: 'Momentos intensos e dinâmicos, com foco em combate, perseguições, desafios físicos e decisões rápidas, promovendo adrenalina e ritmo acelerado na narrativa.',
    icon: Icons.flash_on,
  ),
  GameType(
    title: 'Alta Fantasia',
    description: 'Ambientado em mundos ricos em fantasia, com muita magia, criaturas místicas e batalhas épicas.',
    icon: Icons.auto_awesome,
  ),
  // Adicione os outros tipos conforme sua lista...
];
