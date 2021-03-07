import 'package:carregar_temas_package/src/entities/resultado_theme.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class CarregarTemasPresenter {
  final Datasource<Stream<ResultadoTheme>, ParametrosRetornoResultado>
      datasource;
  final bool mostrarTempoExecucao;

  CarregarTemasPresenter({
    required this.datasource,
    required this.mostrarTempoExecucao,
  });

  Future<RetornoSucessoOuErro<Stream<ResultadoTheme>>> carregarTemas() async {
    final resultado = await RetornoResultadoPresenter<Stream<ResultadoTheme>>(
      mostrarTempoExecucao: mostrarTempoExecucao,
      nomeFeature: "Carregar Tema",
      datasource: datasource,
    ).retornoResultado(
      parametros: NoParams(
        mensagemErro: "Erro ao carregar os dados do tema",
      ),
    );
    return resultado;
  }
}
