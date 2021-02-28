import 'package:carregar_temas_package/carregar_temas_package.dart';
import 'package:carregar_temas_package/src/repositories/carregar_configuracao_temas_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class FairebaseConfiguracaoThemeDatasource extends Mock
    implements Datasource<ResultadoTheme, NoParams> {}

void main() {
  late Datasource<ResultadoTheme, NoParams> datasource;
  late Repositorio<ResultadoTheme, NoParams> repositorio;
  late TempoExecucao tempo;

  setUp(() {
    tempo = TempoExecucao();
    datasource = FairebaseConfiguracaoThemeDatasource();
    repositorio = CarregarConfiguracaoTemasRepositorio(datasource: datasource);
  });

  test('Deve retornar um sucesso com true', () async {
    tempo.iniciar();
    when(datasource).calls(#call).thenAnswer(
          (_) => Future.value(
            ResultadoTheme(
              accent: {"r": 58},
              primary: {"r": 150},
              user: "paulo",
            ),
          ),
        );
    final result = await repositorio(parametros: NoParams());
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do CarregarConfiguracaoTemasRepositorio: ${tempo.calcularExecucao()}ms");
    expect(result, isA<SucessoRetorno<ResultadoTheme>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        isA<ResultadoTheme>());
  });

  test(
      'Deve ErroCarregarTemas com Erro ao carregar os dados da configuração do tema Cod.02-1',
      () async {
    tempo.iniciar();
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await repositorio(parametros: NoParams());
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do CarregarConfiguracaoTemasRepositorio: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<ResultadoTheme>>());
  });
}
