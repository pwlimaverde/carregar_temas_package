import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class CarregarTemasPresenter {
  final bool? mostrarTempoExecucao;

  CarregarTemasPresenter({this.connectivity, this.mostrarTempoExecucao});

  Future<RetornoSucessoOuErro<bool>> consultaConectividade() async {
    TempoExecucao tempo = TempoExecucao();
    tempo.iniciar();
    RetornoSucessoOuErro<bool> resultado = await CarregarTemasUsecase(
      repositorio: ChecarConeccaoRepositorio(
        datasource: ConnectivityDatasource(
          connectivity: connectivity ?? Connectivity(),
        ),
      ),
    )(parametros: NoParams());
    if (mostrarTempoExecucao ?? false) {
      tempo.terminar();
      print(
          "Tempo de Execução do ChecarConeccaoPresenter: ${tempo.calcularExecucao()}ms");
    }
    return resultado;
  }
}
