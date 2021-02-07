import 'package:carregar_temas_package/carregar_temas_package.dart';
import 'package:carregar_temas_package/src/utilitarios/erros_carregar_temas.dart';
import 'package:carregar_temas_package/src/utilitarios/tempo_execucao.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';
import 'package:rxdart/rxdart.dart';

class CarregarTemasRepositorio extends Mock
    implements Repositorio<Stream<ResultadoTheme>, NoParams> {}

void main() {
  late Repositorio<Stream<ResultadoTheme>, NoParams> repositorio;
  late UseCase<Stream<ResultadoTheme>, NoParams> carregarTemasUsecase;
  late TempoExecucao tempo;

  setUp(() {
    tempo = TempoExecucao();
    repositorio = CarregarTemasRepositorio();
    carregarTemasUsecase = CarregarTemasUsecase(repositorio: repositorio);
  });

  test('Deve retornar um sucesso com Stream<ResultadoTheme>', () async {
    tempo.iniciar();
    final testeFire = BehaviorSubject<ResultadoTheme>();
    testeFire.add(
      ResultadoTheme(
        accent: {"r": 58},
        primary: {"r": 150},
        user: "paulo",
      ),
    );
    when(repositorio).calls(#call).thenAnswer((_) => Future.value(
        SucessoRetorno<Stream<ResultadoTheme>>(resultado: testeFire)));
    final result = await carregarTemasUsecase(parametros: NoParams());
    print("teste result - ${await result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ).first}");
    tempo.terminar();
    print(
        "Tempo de Execução do ChecarConeccaoPresenter: ${tempo.calcularExecucao()}ms");
    expect(result, isA<SucessoRetorno<Stream<ResultadoTheme>>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        isA<Stream<ResultadoTheme>>());
    testeFire.close();
  });

  test(
      'Deve retornar um ErrorCarregarTemas com Erro ao carregar os dados tema Cod.01-1',
      () async {
    tempo.iniciar();
    final testeFire = BehaviorSubject<ResultadoTheme>();
    testeFire.add(
      ResultadoTheme(
        accent: {"r": 58},
        primary: {"r": 150},
        user: "paulo",
      ),
    );
    when(repositorio).calls(#call).thenAnswer(
          (_) => Future.value(
            ErroRetorno<Stream<ResultadoTheme>>(
              erro: ErrorCarregarTemas(
                mensagem: "Erro ao carregar os dados tema Cod.01-1",
              ),
            ),
          ),
        );
    final result = await carregarTemasUsecase(parametros: NoParams());
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do ChecarConeccaoPresenter: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<Stream<ResultadoTheme>>>());
    testeFire.close();
  });

  test(
      'Deve retornar um ErrorCarregarTemas com Erro ao carregar os dados tema Cod.01-1',
      () async {
    tempo.iniciar();
    final testeFire = BehaviorSubject<ResultadoTheme>();
    testeFire.add(
      ResultadoTheme(
        accent: {"r": 58},
        primary: {"r": 150},
        user: "paulo",
      ),
    );
    when(repositorio).calls(#call).thenThrow(Exception());
    final result = await carregarTemasUsecase(parametros: NoParams());
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do ChecarConeccaoPresenter: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<Stream<ResultadoTheme>>>());
    testeFire.close();
  });
}
