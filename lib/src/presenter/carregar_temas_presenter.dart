import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../carregar_temas_package.dart';
import '../repositories/carregar_temas_repository.dart';
import '../usecases/carregar_temas_usecase.dart';

class CarregarTemasPresenter {
  final Datasource<Stream<ResultadoTheme>, NoParams> datasource;
  final bool mostrarTempoExecucao;

  CarregarTemasPresenter({
    required this.datasource,
    required this.mostrarTempoExecucao,
  });

  Future<RetornoSucessoOuErro<Stream<ResultadoTheme>>> carregarTemas() async {
    TempoExecucao tempo = TempoExecucao();
    if (mostrarTempoExecucao) {
      tempo.iniciar();
    }
    final resultado = await CarregarTemasUsecase(
      repositorio: CarregarTemasRepositorio(
        datasource: datasource,
      ),
    )(parametros: NoParams());
    if (mostrarTempoExecucao) {
      tempo.terminar();
      print(
          "Tempo de Execução do CarregarTemasPresenter: ${tempo.calcularExecucao()}ms");
    }
    return resultado;
  }
}
