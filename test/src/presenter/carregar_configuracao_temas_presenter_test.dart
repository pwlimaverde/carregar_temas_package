import 'package:carregar_temas_package/carregar_temas_package.dart';
import 'package:carregar_temas_package/src/presenter/carregar_configuracao_temas_presenter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class CarregarConfiguracaoTemasDatasourceMock extends Mock
    implements Datasource<ResultadoTheme, NoParams> {}

void main() {
  late Datasource<ResultadoTheme, NoParams> datasource;

  setUp(() {
    datasource = CarregarConfiguracaoTemasDatasourceMock();
  });

  test('Deve retornar um sucesso com true', () async {
    when(datasource).calls(#call).thenAnswer(
          (_) => Future.value(
            ResultadoTheme(
              accent: {"r": 58},
              primary: {"r": 150},
              user: "paulo",
            ),
          ),
        );
    final result = await CarregarConfiguracaoTemasPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).carregarConfiguracaoTemas();
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    expect(result, isA<SucessoRetorno<ResultadoTheme>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        isA<ResultadoTheme>());
  });

  test('Deve ErroCarregarTemas com Erro ao carregar os dados tema Cod.02-1',
      () async {
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await CarregarConfiguracaoTemasPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).carregarConfiguracaoTemas();
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    expect(result, isA<ErroRetorno<ResultadoTheme>>());
  });
}
