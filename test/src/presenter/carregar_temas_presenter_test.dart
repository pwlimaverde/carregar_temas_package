import 'package:carregar_temas_package/carregar_temas_package.dart';
import 'package:carregar_temas_package/src/presenter/carregar_temas_presenter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:return_success_or_error/return_success_or_error.dart';
import 'package:rxdart/rxdart.dart';

class FairebaseThemeDatasourceMock extends Mock
    implements Datasource<Stream<ResultadoTheme>> {}

void main() {
  late Datasource<Stream<ResultadoTheme>> datasource;

  setUp(() {
    datasource = FairebaseThemeDatasourceMock();
  });

  test('Deve retornar um sucesso com true', () async {
    final testeFire = BehaviorSubject<ResultadoTheme>();
    testeFire.add(
      ResultadoTheme(
        accent: {"r": 58},
        primary: {"r": 150},
        user: "paulo",
      ),
    );
    when(datasource).calls(#call).thenAnswer((_) => Future.value(testeFire));
    final result = await CarregarTemasPresenter(
      datasource: datasource,
      mostrarTempoExecucao: true,
    ).carregarTemas();
    print("teste result - ${await result.fold(
          success: (value) => value.result,
          error: (value) => value.error,
        ).first}");
    expect(result, isA<SuccessReturn<Stream<ResultadoTheme>>>());
    expect(
        result.fold(
          success: (value) => value.result,
          error: (value) => value.error,
        ),
        isA<Stream<ResultadoTheme>>());
    testeFire.close();
  });

  test('Deve ErroCarregarTemas com Erro ao carregar os dados tema Cod.02-1',
      () async {
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await CarregarTemasPresenter(
            datasource: datasource, mostrarTempoExecucao: true)
        .carregarTemas();
    print("teste result - ${await result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<ErrorReturn<Stream<ResultadoTheme>>>());
  });
}
