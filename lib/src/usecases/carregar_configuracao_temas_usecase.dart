import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../utilitarios/erros_carregar_temas.dart';
import 'entities/resultado_theme.dart';

class CarregarConfiguracaoTemasUsecase
    extends UseCase<ResultadoTheme, NoParams> {
  final Repositorio<ResultadoTheme, NoParams> repositorio;

  CarregarConfiguracaoTemasUsecase({required this.repositorio});

  @override
  Future<RetornoSucessoOuErro<ResultadoTheme>> call(
      {required NoParams parametros}) async {
    try {
      final resultado = await retornoRepositorio(
        repositorio: repositorio,
        erro: ErroCarregarConfiguracaoTemas(
            mensagem:
                "Erro ao carregar os dados da configuração do tema Cod.01-1"),
        parametros: NoParams(),
      );
      return resultado;
    } catch (e) {
      return ErroRetorno(
        erro: ErroCarregarConfiguracaoTemas(
          mensagem:
              "${e.toString()} - Erro ao carregar os dados da configuração do  do tema Cod.01-2",
        ),
      );
    }
  }
}
