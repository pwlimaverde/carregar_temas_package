import 'package:carregar_temas_package/src/repositories/atualizar_cor_temas_repository.dart';
import 'package:carregar_temas_package/src/utilitarios/Parametros.dart';
import 'package:carregar_temas_package/src/utilitarios/erros_carregar_temas.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class FairebaseAtualizarCorTemasDatasourceMock extends Mock
    implements Datasource<bool, ParametrosAtualizarCorTemas> {}

void main() {
  late Datasource<bool, ParametrosAtualizarCorTemas> datasource;
  late Repositorio<bool, ParametrosAtualizarCorTemas> repositorio;
  late TempoExecucao tempo;

  setUp(() {
    tempo = TempoExecucao();
    datasource = FairebaseAtualizarCorTemasDatasourceMock();
    repositorio = AtualizarCorTemasRepositorio(datasource: datasource);
  });

  test('Deve retornar um sucesso com true', () async {
    tempo.iniciar();
    when(datasource).calls(#call).thenAnswer((_) => Future.value(true));
    final result = await repositorio(
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
    tempo.terminar();
    print(
        "Tempo de Execução do AtualizarCorTemasRepositorio: ${tempo.calcularExecucao()}ms");
    expect(result, isA<SucessoRetorno<bool>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        equals(true));
  });

  test('Deve retornar um sucesso com false', () async {
    tempo.iniciar();
    when(datasource).calls(#call).thenAnswer((_) => Future.value(false));
    final result = await repositorio(
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
    tempo.terminar();
    print(
        "Tempo de Execução do AtualizarCorTemasRepositorio: ${tempo.calcularExecucao()}ms");
    expect(result, isA<SucessoRetorno<bool>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        equals(false));
  });

  test(
      'Deve retornar um ErroAtualizarCorTemas com Erro ao atualizar a cor do tema Cod.02-1',
      () async {
    tempo.iniciar();
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await repositorio(
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
    tempo.terminar();
    print(
        "Tempo de Execução do AtualizarCorTemasRepositorio: ${tempo.calcularExecucao()}ms");
    expect(result, isA<ErroRetorno<bool>>());
    expect(
        result.fold(
          sucesso: (value) => value.resultado,
          erro: (value) => value.erro,
        ),
        isA<ErroAtualizarCorTemas>());
  });
}
