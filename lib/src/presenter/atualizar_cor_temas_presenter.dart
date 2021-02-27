import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../repositories/atualizar_cor_temas_repository.dart';
import '../usecases/atualizar_cor_temas_usecase.dart';
import '../utilitarios/Parametros.dart';

class AtualizarCorTemasPresenter {
  final Datasource<bool, ParametrosAtualizarCorTemas> datasource;
  final bool mostrarTempoExecucao;

  AtualizarCorTemasPresenter({
    required this.datasource,
    required this.mostrarTempoExecucao,
  });

  Future<RetornoSucessoOuErro<bool>> atualizarCorTemas({
    required ParametrosAtualizarCorTemas parametros,
  }) async {
    TempoExecucao tempo = TempoExecucao();
    if (mostrarTempoExecucao) {
      tempo.iniciar();
    }
    final resultado = await AtualizarCorTemasUsecase(
      repositorio: AtualizarCorTemasRepositorio(
        datasource: datasource,
      ),
    )(parametros: parametros);
    if (mostrarTempoExecucao) {
      tempo.terminar();
      print(
          "Tempo de Execução do AtualizarCorTemasPresenter: ${tempo.calcularExecucao()}ms");
    }
    return resultado;
  }
}
