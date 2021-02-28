import 'package:carregar_temas_package/carregar_temas_package.dart';
import 'package:carregar_temas_package/src/usecases/carregar_configuracao_temas.dart';
import 'package:carregar_temas_package/src/utilitarios/erros_carregar_temas.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class CarregarConfiguracaoTemasRepositorioMock extends Mock
    implements Repositorio<ResultadoTheme, NoParams> {}

void main() {
  late Repositorio<ResultadoTheme, NoParams> repositorio;
  late UseCase<ResultadoTheme, NoParams> carregarConfiguracaoTemasUsecase;
  late TempoExecucao tempo;

  setUp(() {
    tempo = TempoExecucao();
    repositorio = CarregarConfiguracaoTemasRepositorioMock();
    carregarConfiguracaoTemasUsecase =
        CarregarConfiguracaoTemasUsecase(repositorio: repositorio);
  });

  test('Deve retornar um sucesso com ResultadoTheme', () async {
    tempo.iniciar();
    when(repositorio).calls(#call).thenAnswer(
          (_) => Future.value(
            SucessoRetorno<ResultadoTheme>(
              resultado: ResultadoTheme(
                accent: {"r": 58},
                primary: {"r": 150},
                user: "paulo",
              ),
            ),
          ),
        );
    final result =
        await carregarConfiguracaoTemasUsecase(parametros: NoParams());
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do ChecarConeccaoPresenter: ${tempo.calcularExecucao()}ms");
    expect(result, isA<SucessoRetorno<ResultadoTheme>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        isA<ResultadoTheme>());
  });

  test(
      'Deve retornar um ErroCarregarTemas com Erro ao carregar os dados da configuração do tema Cod.01-1',
      () async {
    when(repositorio).calls(#call).thenAnswer(
          (_) => Future.value(
            ErroRetorno<ResultadoTheme>(
              erro: ErroCarregarTemas(
                mensagem: "Erro ao carregar os dados tema Cod.01-1",
              ),
            ),
          ),
        );
    final result =
        await carregarConfiguracaoTemasUsecase(parametros: NoParams());
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do ChecarConeccaoPresenter: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<ResultadoTheme>>());
  });

  test(
      'Deve retornar um ErroCarregarTemas com Erro ao carregar os dados da configuração do tema Cod.01-1',
      () async {
    tempo.iniciar();
    when(repositorio).calls(#call).thenThrow(Exception());
    final result =
        await carregarConfiguracaoTemasUsecase(parametros: NoParams());
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do ChecarConeccaoPresenter: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<ResultadoTheme>>());
  });
}
