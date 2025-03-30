import 'package:flutter/material.dart';

class GameType {
  final String title;
  final String description;
  final String? iconAsset;

  GameType({
    required this.title,
    required this.description,
    required this.iconAsset,
  });
}

final List<GameType> gameTypes = [
  GameType(
    title: 'Ação',
    description:
        'Momentos intensos e dinâmicos, com foco em combate, perseguições, desafios físicos e decisões rápidas, promovendo adrenalina e ritmo acelerado na narrativa.',
    iconAsset: 'assets/icons/tipos-jogo/acao.svg',
  ),
  GameType(
    title: 'Alta Fantasia',
    description:
        'Ambientado em mundos ricos em fantasia, com muita magia, criaturas místicas e batalhas épicas.',
    iconAsset: 'assets/icons/tipos-jogo/alta-fantasia.svg',
  ),
  // Adicione os outros tipos conforme sua lista...
];
