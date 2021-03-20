import 'package:carregar_temas_package/src/presenter/atualizar_cor_temas_presenter.dart';
import 'package:carregar_temas_package/src/utilitarios/Parametros.dart';
import 'package:carregar_temas_package/src/utilitarios/erros_carregar_temas.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:return_success_or_error/return_success_or_error.dart';

class FairebaseAtualizarCorTemasDatasourceMock extends Mock
    implements Datasource<bool> {}

void main() {
  late Datasource<bool> datasource;

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
        key: KeyCorTema.primary,
        user: "uidfirebase",
        error: ErroAtualizarCorTemas(message: "teste erro"),
      ),
    );
    print("teste result - ${await result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<SuccessReturn<bool>>());
    expect(
        result.fold(
          success: (value) => value.result,
          error: (value) => value.error,
        ),
        equals(true));
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
        key: KeyCorTema.primary,
        user: "uidfirebase",
        error: ErroAtualizarCorTemas(message: "teste erro"),
      ),
    );
    print("teste result - ${await result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<ErrorReturn<bool>>());
    expect(
        result.fold(
          success: (value) => value.result,
          error: (value) => value.error,
        ),
        isA<ErroAtualizarCorTemas>());
  });
}
