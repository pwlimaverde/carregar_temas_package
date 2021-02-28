import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../carregar_temas_package.dart';
import '../repositories/carregar_configuracao_temas_repository.dart';
import '../usecases/carregar_configuracao_temas_usecase.dart';

class CarregarConfiguracaoTemasPresenter {
  final Datasource<ResultadoTheme, NoParams> datasource;
  final bool mostrarTempoExecucao;

  CarregarConfiguracaoTemasPresenter({
    required this.datasource,
    required this.mostrarTempoExecucao,
  });

  Future<RetornoSucessoOuErro<ResultadoTheme>>
      carregarConfiguracaoTemas() async {
    TempoExecucao tempo = TempoExecucao();
    if (mostrarTempoExecucao) {
      tempo.iniciar();
    }
    final resultado = await CarregarConfiguracaoTemasUsecase(
      repositorio: CarregarConfiguracaoTemasRepositorio(
        datasource: datasource,
      ),
    )(parametros: NoParams());
    if (mostrarTempoExecucao) {
      tempo.terminar();
      print(
          "Tempo de Execução do CarregarConfiguracaoTemasPresenter: ${tempo.calcularExecucao()}ms");
    }
    return resultado;
  }
}
