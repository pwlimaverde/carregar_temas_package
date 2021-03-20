import 'package:return_success_or_error/return_success_or_error.dart';

import '../../carregar_temas_package.dart';

class AtualizarCorTemasPresenter {
  final Datasource<bool> datasource;
  final bool mostrarTempoExecucao;

  AtualizarCorTemasPresenter({
    required this.datasource,
    required this.mostrarTempoExecucao,
  });

  Future<ReturnSuccessOrError<bool>> atualizarCorTemas({
    required ParametrosAtualizarCorTemas parametros,
  }) async {
    final resultado = await ReturnResultPresenter<bool>(
      showRuntimeMilliseconds: mostrarTempoExecucao,
      nameFeature: "Atualizar Cor do Tema",
      datasource: datasource,
    )(
      parameters: parametros,
    );
    return resultado;
  }
}
