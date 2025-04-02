import 'package:flutter/material.dart';

class PlataformType {
  final String title;
  final String description;
  final String? iconAsset;

  PlataformType({
    required this.title,
    required this.description,
    required this.iconAsset
  });
}

final List<PlataformType> platformTypes = [
  PlataformType(
    title: 'Presencial',
    description: 'Indivíduos se reúnem presencialmente para jogar, combinando um local específico.',
    iconAsset: 'assets/icons/plataformas/presencial.svg',
  ),
  PlataformType(
    title: 'Remoto',
    description: 'Indivíduos se reúnem remotamente para jogar, em geral usando plataformas virtuais diversas.',
    iconAsset: 'assets/icons/plataformas/remoto.svg',
  ),
  PlataformType(
    title: 'PC',
    description: 'Um computador (seja desktop ou notebook) é usado para jogar.',
    iconAsset: 'assets/icons/plataformas/pc.svg',
  ),
  PlataformType(
    title: 'Mobile',
    description: 'Um dispositivo móvel (celular ou tablet) é usado para jogar.',
    iconAsset: 'assets/icons/plataformas/mobile.svg',
  ),
];
