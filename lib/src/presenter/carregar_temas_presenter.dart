import 'package:carregar_temas_package/src/repositories/carregar_temas_repository.dart';
import 'package:carregar_temas_package/src/utilitarios/tempo_execucao.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../carregar_temas_package.dart';

class CarregarTemasPresenter {
  final Datasource<Stream<ResultadoTheme>, NoParams> datasource;
  final bool? mostrarTempoExecucao;

  CarregarTemasPresenter({required this.datasource, this.mostrarTempoExecucao});

  Future<RetornoSucessoOuErro<Stream<ResultadoTheme>>> carregarTemas() async {
    TempoExecucao tempo = TempoExecucao();
    tempo.iniciar();
    final resultado = await CarregarTemasUsecase(
      repositorio: CarregarTemasRepositorio(
        datasource: datasource,
      ),
    )(parametros: NoParams());
    if (mostrarTempoExecucao ?? false) {
      tempo.terminar();
      print(
          "Tempo de Execução do CarregarTemasPresenter: ${tempo.calcularExecucao()}ms");
    }
    return resultado;
  }
}
