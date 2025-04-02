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
  GameType(
    title: 'Alternativo',
    description:
        'Jogos que fogem dos padrões tradicionais, experimentando com mecânicas ou temas incomuns. Ideal para jogadores criativos e abertos a novas ideias.',
    iconAsset: 'assets/icons/tipos-jogo/alternativo.svg',
  ),
  GameType(
    title: 'Animesco',
    description:
        'Inspirado em temas e estilos de animes, com personagens exagerados, poderes únicos e narrativas dramáticas ou cômicas.',
    iconAsset: 'assets/icons/tipos-jogo/animesco.svg',
  ),
  GameType(
    title: 'Assíncrono',
    description:
        'Jogos onde as interações acontecem de forma espaçada no tempo, permitindo que jogadores participem conforme sua disponibilidade. Geralmente realizados por texto, com foco em narrativa detalhada e flexibilidade.',
    iconAsset: 'assets/icons/tipos-jogo/assincrono.svg',
  ),
  GameType(
    title: 'Baixa Fantasia',
    description:
        'Fantasia mais realista, com pouca magia e foco em conflitos humanos e sobrevivência. Os desafios tendem a ser mais mundanos.',
    iconAsset: 'assets/icons/tipos-jogo/baixa-fantasia.svg',
  ),
  GameType(
    title: 'Cyberpunk',
    description:
        'Histórias em cenários urbanos futuristas, com temas de tecnologia, distopias e corporações opressoras. Caracterizado pela frase “high tech, low life” (“alta tecnologia, baixo estilo de vida”).',
    iconAsset: 'assets/icons/tipos-jogo/cyberpunk.svg',
  ),
  GameType(
    title: 'Dungeon Crawl',
    description:
        'Focado em invadir masmorras, combater monstros e coletar tesouros. Geralmente mais linear, com ênfase em desafios físicos e mentais.',
    iconAsset: 'assets/icons/tipos-jogo/dungeon-crawl.svg',
  ),
  GameType(
    title: 'Épico',
    description:
        'Narrativas grandiosas, onde os personagens enfrentam ameaças globais, universais ou multiversais, assumindo papéis de figuras lendárias.',
    iconAsset: 'assets/icons/tipos-jogo/epico.svg',
  ),
  GameType(
    title: 'Estratégico',
    description:
        'Planejamento tático, gerenciamento de recursos e tomada de decisões cuidadosas, frequentemente em combate ou resolução de desafios estruturados, com regras detalhadas e foco na eficiência e lógica dos jogadores.',
    iconAsset: 'assets/icons/tipos-jogo/estrategico.svg',
  ),
  GameType(
    title: 'Exploratório',
    description:
        'Valoriza a descoberta de mundos, mapas e segredos. Aventuras focadas em exploração e desbravamento de regiões desconhecidas.',
    iconAsset: 'assets/icons/tipos-jogo/exploratorio.svg',
  ),
  GameType(
    title: 'Ficção Científica',
    description:
        'Histórias que abordam diversos temas de uma forma mais científica e racional. Aqui o extraordinário geralmente pode ser explicado por regras científicas, sejam elas reais ou imaginárias.',
    iconAsset: 'assets/icons/tipos-jogo/ficcao-cientifica.svg',
  ),
  GameType(
    title: 'Grátis',
    description: 'Mesas gratuitas.',
    iconAsset: 'assets/icons/tipos-jogo/gratis.svg',
  ),
  GameType(
    title: 'Grimdark',
    description:
        'Cenários sombrios e brutais, onde a moralidade é ambígua, a violência é prevalente, e o desespero e a falta de esperança permeiam a narrativa. Um mundo cruel e implacável.',
    iconAsset: 'assets/icons/tipos-jogo/grimdark.svg',
  ),
  GameType(
    title: 'Histórico',
    description:
        'Ambientado em períodos históricos, com foco em autenticidade e realismo. Ideal para jogadores interessados em história e recriações.',
    iconAsset: 'assets/icons/tipos-jogo/historico.svg',
  ),
  GameType(
    title: 'Humorístico',
    description:
        'Estilo descontraído, onde situações engraçadas e interação leve são priorizadas. Ideal para quem quer se divertir sem muita seriedade.',
    iconAsset: 'assets/icons/tipos-jogo/humoristico.svg',
  ),
  GameType(
    title: 'Interpretativo',
    description:
        'Centrado na interpretação de personagens. Os jogadores se esforçam para agir de acordo com a personalidade, motivações e história de seus personagens, frequentemente priorizando o roleplay sobre mecânicas.',
    iconAsset: 'assets/icons/tipos-jogo/interpretativo.svg',
  ),
  GameType(
    title: 'Intriga Social',
    description:
        'Aventuras focadas em manipulação, alianças, traições e relações interpessoais. Requer jogadores que apreciem jogos mentais e estratégias sociais.',
    iconAsset: 'assets/icons/tipos-jogo/intriga-social.svg',
  ),
  GameType(
    title: 'LARP',
    description:
        'Live Action Role-Playing é semelhante a uma peça teatral improvisada, envolvendo a interpretação física de personagens em cenários reais, incluindo muitas vezes o uso de fantasias. Diferente dos TTRPGs, LARP não ocorre em uma mesa (nem física nem virtual), mas sim em espaços mais abertos.',
    iconAsset: 'assets/icons/tipos-jogo/larp.svg',
  ),
  GameType(
    title: 'Mistério',
    description:
        'Focado em resolver mistérios. Ideal para jogadores que gostam de quebra-cabeças, investigação e suspense.',
    iconAsset: 'assets/icons/tipos-jogo/misterio.svg',
  ),
  GameType(
    title: 'Narrativo',
    description:
        'Focado em contar histórias e desenvolver personagens. Jogadores e mestres colaboram para criar uma trama envolvente.',
    iconAsset: 'assets/icons/tipos-jogo/narrativo.svg',
  ),
  GameType(
    title: 'Pago',
    description:
        'Mesas pagas. Boas mesas pagas oferecem coisas que geralmente não se vê em mesas gratuitas.',
    iconAsset: 'assets/icons/tipos-jogo/pago.svg',
  ),
  GameType(
    title: 'Síncrono',
    description:
        'Jogos realizados em tempo real, com todos os participantes presentes simultaneamente (seja de forma presencial ou remota). Permite interações imediatas e maior dinamismo nas respostas e na narrativa.',
    iconAsset: 'assets/icons/tipos-jogo/sincrono.svg',
  ),
  GameType(
    title: 'Slice of Life',
    description:
        'Jogos focados em explorar o dia a dia dos personagens, com temas mais leves e introspectivos, geralmente em cenários contemporâneos ou fantásticos.',
    iconAsset: 'assets/icons/tipos-jogo/slice-of-life.svg',
  ),
  GameType(
    title: 'Sobrevivência',
    description:
        'Histórias desafiadoras onde a sobrevivência é o objetivo principal. Recursos limitados, decisões difíceis e ameaças constantes.',
    iconAsset: 'assets/icons/tipos-jogo/sobrevivencia.svg',
  ),
  GameType(
    title: 'Steampunk',
    description:
        'Aventura em um mundo retrofuturista movido a vapor, com engenhocas tecnológicas e elementos vitorianos.',
    iconAsset: 'assets/icons/tipos-jogo/steampunk.svg',
  ),
  GameType(
    title: 'Surreal',
    description:
        'Narrativas que desafiam a lógica, explorando mundos oníricos, realidades alternativas e conceitos abstratos.',
    iconAsset: 'assets/icons/tipos-jogo/surreal.svg',
  ),
  GameType(
    title: 'Terror',
    description:
        'Temas perturbadores e atmosferas tensas, com foco em fuga, mistério e sobrevivência. Os jogadores são desafiados a lidar com horrores de vários tipos.',
    iconAsset: 'assets/icons/tipos-jogo/terror.svg',
  ),
  GameType(
    title: 'Textual',
    description:
        'Jogos em que todos se comunicam por texto, incluindo falas, ações e narrações.',
    iconAsset: 'assets/icons/tipos-jogo/textual.svg',
  ),
  GameType(
    title: 'Tragédia',
    description:
        'Focado em narrativas dramáticas e emocionais, onde os personagens enfrentam perdas, fracasso ou consequências irreversíveis, enfatizando dilemas morais e o impacto de escolhas difíceis.',
    iconAsset: 'assets/icons/tipos-jogo/tragedia.svg',
  ),
  GameType(
    title: 'TTRPG',
    description:
        'Tabletop Role-Playing Game. Estilo tradicional de RPG, geralmente jogado em torno de uma mesa (física ou virtual), com foco em narrativa compartilhada, interpretação de personagens e/ou resolução de desafios usando regras e dados.',
    iconAsset: 'assets/icons/tipos-jogo/ttrpg.svg',
  ),
  GameType(
    title: 'Vocal',
    description:
        'Jogos em que todos se comunicam por voz, incluindo falas, ações e narrações.',
    iconAsset: 'assets/icons/tipos-jogo/vocal.svg',
  ),
];
