import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../../carregar_temas_package.dart';
import '../utilitarios/erros_carregar_temas.dart';

class CarregarConfiguracaoTemasRepositorio
    extends Repositorio<ResultadoTheme, NoParams> {
  final Datasource<ResultadoTheme, NoParams> datasource;

  CarregarConfiguracaoTemasRepositorio({required this.datasource});

  @override
  Future<RetornoSucessoOuErro<ResultadoTheme>> call(
      {required NoParams parametros}) async {
    final resultado = await retornoDatasource(
      datasource: datasource,
      erro: ErroCarregarConfiguracaoTemas(
        mensagem: "Erro ao carregar os dados da configuração do tema Cod.02-1",
      ),
      parametros: NoParams(),
    );
    return resultado;
  }
}
