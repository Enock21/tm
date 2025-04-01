import 'package:flutter/material.dart';

class PlataformType {
  final String title;
  final String description;

  PlataformType({
    required this.title,
    required this.description,
  });
}

final List<PlataformType> platformTypes = [
  PlataformType(
    title: 'Presencial',
    description: 'Indivíduos se reúnem presencialmente para jogar, combinando um local específico.',
  ),
  PlataformType(
    title: 'Remoto',
    description: 'Indivíduos se reúnem remotamente para jogar, em geral usando plataformas virtuais diversas.',
  ),
  PlataformType(
    title: 'PC',
    description: 'Um computador (seja desktop ou notebook) é usado para jogar.',
  ),
  PlataformType(
    title: 'Mobile',
    description: 'Um dispositivo móvel (celular ou tablet) é usado para jogar.',
  ),
];
