import 'package:carregar_temas_package/src/utilitarios/Parametros.dart';
import 'package:carregar_temas_package/src/utilitarios/erros_carregar_temas.dart';
import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class AtualizarCorTemasRepositorio
    extends Repositorio<bool, ParametrosAtualizarCorTemas> {
  final Datasource<bool, ParametrosAtualizarCorTemas> datasource;

  AtualizarCorTemasRepositorio({required this.datasource});

  @override
  Future<RetornoSucessoOuErro<bool>> call(
      {required ParametrosAtualizarCorTemas parametros}) async {
    final resultado = await retornoDatasource(
      datasource: datasource,
      erro: ErroAtualizarCorTemas(
        mensagem: "Erro ao atualizar a cor do tema Cod.02-1",
      ),
      parametros: parametros,
    );
    return resultado;
  }
}
