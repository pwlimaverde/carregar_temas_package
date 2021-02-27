import 'package:carregar_temas_package/src/usecases/atualizar_cor_temas_usecase.dart';
import 'package:carregar_temas_package/src/utilitarios/Parametros.dart';
import 'package:carregar_temas_package/src/utilitarios/erros_carregar_temas.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class AtualizarCorTemasMock extends Mock
    implements Repositorio<bool, ParametrosAtualizarCorTemas> {}

void main() {
  late Repositorio<bool, ParametrosAtualizarCorTemas> repositorio;
  late UseCase<bool, ParametrosAtualizarCorTemas> atualizarCorTemas;
  late TempoExecucao tempo;

  setUp(() {
    tempo = TempoExecucao();
    repositorio = AtualizarCorTemasMock();
    atualizarCorTemas = AtualizarCorTemasUsecase(repositorio: repositorio);
  });

  test('Deve retornar um sucesso com Stream<ResultadoTheme>', () async {
    tempo.iniciar();
    when(repositorio)
        .calls(#call)
        .thenAnswer((_) => Future.value(SucessoRetorno<bool>(resultado: true)));
    final result = await atualizarCorTemas(
      parametros: ParametrosAtualizarCorTemas(
        cor: {
          "r": 60,
          "g": 60,
          "b": 60,
        },
        key: KeyCorTema.primary,
        user: "uidfirebase",
      ),
    );
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do AtualizarCorTemasUsecase: ${tempo.calcularExecucao()}ms");
    expect(result, isA<SucessoRetorno<bool>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        equals(true));
  });

  test(
      'Deve retornar um ErroAtualizarCorTemas Erro ao atualizar a cor do tema Cod.01-1',
      () async {
    tempo.iniciar();
    when(repositorio).calls(#call).thenAnswer(
        (_) => Future.value(SucessoRetorno<bool>(resultado: false)));
    final result = await atualizarCorTemas(
      parametros: ParametrosAtualizarCorTemas(
        cor: {
          "r": 60,
          "g": 60,
          "b": 60,
        },
        key: KeyCorTema.primary,
        user: "uidfirebase",
      ),
    );
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do AtualizarCorTemasUsecase: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<bool>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        isA<ErroAtualizarCorTemas>());
  });

  test(
      'Deve retornar um ErroAtualizarCorTemas Erro ao atualizar a cor do tema Cod.01-2',
      () async {
    tempo.iniciar();
    when(repositorio).calls(#call).thenThrow(Exception());
    final result = await atualizarCorTemas(
      parametros: ParametrosAtualizarCorTemas(
        cor: {
          "r": 60,
          "g": 60,
          "b": 60,
        },
        key: KeyCorTema.primary,
        user: "uidfirebase",
      ),
    );
    print("teste result - ${await result.fold(
      sucesso: (value) => value.resultado,
      erro: (value) => value.erro,
    )}");
    tempo.terminar();
    print(
        "Tempo de Execução do AtualizarCorTemasUsecase: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<bool>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        isA<ErroAtualizarCorTemas>());
  });
}
