import 'dart:io';
import 'dart:math';

import 'package:desafio_dart_imc_dio/classificacao_imc.dart';
import 'package:desafio_dart_imc_dio/pessoa.dart';

double calcularImc({required double peso, required double altura}) {
  return double.parse((peso / pow(altura, 2)).toStringAsFixed(2));
}

ClassificacaoImc obterClassificacao(double imc) => switch (imc) {
      >= 0 && < 16 => ClassificacaoImc.magrezaGrave,
      >= 16 && < 17 => ClassificacaoImc.magrezaModerada,
      >= 17 && < 18.5 => ClassificacaoImc.magrezaLeve,
      >= 18.5 && < 25 => ClassificacaoImc.saudavel,
      >= 25 && < 30 => ClassificacaoImc.sobrepeso,
      >= 30 && < 35 => ClassificacaoImc.obesidadeGrauUm,
      >= 35 && < 40 => ClassificacaoImc.obesidadeGrauDois,
      _ => ClassificacaoImc.obesidadeGrauTres,
    };

void solicitarCadastro() {
  late Pessoa pessoa;
  String nome = '';
  double peso = 0;
  double altura = 0;
  bool concluido = false;

  while (concluido == false) {
    try {
      if (nome.isEmpty) {
        nome = lerDados('Informe seu nome: ');
      }
      if (peso <= 0) {
        peso = lerDados('Informe seu peso: ', parseDouble: true);
      }
      if (altura <= 0) {
        altura = lerDados('Informe sua altura: ', parseDouble: true);
      }
      pessoa = Pessoa(nome: nome, peso: peso, altura: altura);
      concluido = true;
    } catch (e) {
      if (e is FormatException) {
        print('Peso/Altura invalido');
      }

      print(e);
    }
  }

  final double imc = calcularImc(peso: pessoa.peso, altura: pessoa.altura);
  final ClassificacaoImc classificacao = obterClassificacao(imc);

  print('IMC = $imc - ${classificacao.descricao}');
}

dynamic lerDados(String mensagem, {bool parseDouble = false}) {
  stdout.write(mensagem);
  String? dado = stdin.readLineSync();

  if (dado == null || dado.isEmpty) {
    throw Exception('Dado invalido');
  }

  if (parseDouble) {
    double temp = double.parse(dado);

    if (temp.isNegative || temp == 0) {
      throw Exception('O valor informado não pode ser negativo ou zero');
    }

    return temp;
  }

  return dado;
}
