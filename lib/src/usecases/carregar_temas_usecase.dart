import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

import '../utilitarios/erros_carregar_temas.dart';
import 'entities/resultado_theme.dart';

class CarregarTemasUsecase extends UseCase<Stream<ResultadoTheme>, NoParams> {
  final Repositorio<Stream<ResultadoTheme>, NoParams> repositorio;

  CarregarTemasUsecase({required this.repositorio});

  @override
  Future<RetornoSucessoOuErro<Stream<ResultadoTheme>>> call(
      {required NoParams parametros}) async {
    try {
      final resultado = await retornoRepositorio(
        repositorio: repositorio,
        erro: ErrorCarregarTemas(
            mensagem: "Erro ao carregar os dados tema Cod.01-1"),
        parametros: NoParams(),
      );
      return resultado;
    } catch (e) {
      return ErroRetorno(
        erro: ErrorCarregarTemas(
          mensagem:
              "${e.toString()} - Erro ao carregar os dados do thema Cod.01-2",
        ),
      );
    }
  }
}
