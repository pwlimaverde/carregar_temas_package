import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../carregar_temas_package.dart';

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
    final resultado = await RetornoResultadoPresenter<bool>(
      mostrarTempoExecucao: mostrarTempoExecucao,
      nomeFeature: "Atualizar Cor do Tema",
      datasource: datasource,
    ).retornoResultado(
      parametros: parametros,
    );
    return resultado;
  }
}
