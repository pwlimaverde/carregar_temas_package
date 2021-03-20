import 'package:return_success_or_error/return_success_or_error.dart';

import '../entities/resultado_theme.dart';
import '../utilitarios/erros_carregar_temas.dart';

class CarregarTemasPresenter {
  final Datasource<Stream<ResultadoTheme>> datasource;
  final bool mostrarTempoExecucao;

  CarregarTemasPresenter({
    required this.datasource,
    required this.mostrarTempoExecucao,
  });

  Future<ReturnSuccessOrError<Stream<ResultadoTheme>>> carregarTemas() async {
    final resultado = await ReturnResultPresenter<Stream<ResultadoTheme>>(
      showRuntimeMilliseconds: mostrarTempoExecucao,
      nameFeature: "Carregar Tema",
      datasource: datasource,
    )(
      parameters: NoParams(
        error: ErroCarregarTemas(message: "Erro ao carregar os dados do tema"),
      ),
    );
    return resultado;
  }
}
