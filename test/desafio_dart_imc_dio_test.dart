import 'package:desafio_dart_imc_dio/calcular_imc.dart';
import 'package:desafio_dart_imc_dio/classificacao_imc.dart';
import 'package:test/test.dart';

void main() {
  group('Calculo de IMC:', () {
    test('deve calcular o IMC corretamente', () {
      final double peso = 100;
      final double altura = 1.75;

      expect(calcularImc(peso: peso, altura: altura), 32.65);
    });
  });

  group('Classificação do IMC:', () {
    test('deve retornar a classificação corretamente', () {
      final double peso = 100;
      final double altura = 1.75;
      final double imc = calcularImc(peso: peso, altura: altura);

      expect(obterClassificacao(imc), ClassificacaoImc.obesidadeGrauUm);
    });
  });
}
