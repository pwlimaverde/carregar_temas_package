import 'package:carregar_temas_package/src/presenter/atualizar_cor_temas_presenter.dart';
import 'package:carregar_temas_package/src/utilitarios/Parametros.dart';
import 'package:carregar_temas_package/src/utilitarios/erros_carregar_temas.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class FairebaseAtualizarCorTemasDatasourceMock extends Mock
    implements Datasource<bool, ParametrosAtualizarCorTemas> {}

void main() {
  late Datasource<bool, ParametrosAtualizarCorTemas> datasource;

  setUp(() {
    datasource = FairebaseAtualizarCorTemasDatasourceMock();
  });

  test('Deve retornar um sucesso com true', () async {
    when(datasource).calls(#call).thenAnswer((_) => Future.value(true));
    final result = await AtualizarCorTemasPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).atualizarCorTemas(
      parametros: ParametrosAtualizarCorTemas(
        cor: {
          "r": 60,
          "g": 60,
          "b": 60,
        },
        key: "primary",
        user: "uidfirebase",
      ),
    );
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    expect(result, isA<SucessoRetorno<bool>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        equals(true));
  });

  test(
      'Deve retornar um ErroAtualizarCorTemas com Erro ao atualizar a cor do tema Cod.01-1',
      () async {
    when(datasource).calls(#call).thenAnswer((_) => Future.value(false));
    final result = await AtualizarCorTemasPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).atualizarCorTemas(
      parametros: ParametrosAtualizarCorTemas(
        cor: {
          "r": 60,
          "g": 60,
          "b": 60,
        },
        key: "primary",
        user: "uidfirebase",
      ),
    );
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    expect(result, isA<ErroRetorno<bool>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        isA<ErroAtualizarCorTemas>());
  });

  test(
      'Deve retornar um ErroAtualizarCorTemas com Erro ao atualizar a cor do tema Cod.02-1',
      () async {
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await AtualizarCorTemasPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).atualizarCorTemas(
      parametros: ParametrosAtualizarCorTemas(
        cor: {
          "r": 60,
          "g": 60,
          "b": 60,
        },
        key: "primary",
        user: "uidfirebase",
      ),
    );
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    expect(result, isA<ErroRetorno<bool>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        isA<ErroAtualizarCorTemas>());
  });
}
