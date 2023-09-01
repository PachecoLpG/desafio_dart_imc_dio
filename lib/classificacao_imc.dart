enum ClassificacaoImc {
  magrezaGrave(descricao: 'Magreza grave'),
  magrezaModerada(descricao: 'Magreza moderada'),
  magrezaLeve(descricao: 'Magreza leve'),
  saudavel(descricao: 'Saudavel'),
  sobrepeso(descricao: 'Sobrepeso'),
  obesidadeGrauUm(descricao: 'Obesidade grau 1'),
  obesidadeGrauDois(descricao: 'Obesidade grau 2'),
  obesidadeGrauTres(descricao: 'Obesidade grau 3');

  const ClassificacaoImc({required this.descricao});

  final String descricao;
}
