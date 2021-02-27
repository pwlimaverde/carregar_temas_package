import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class ErroCarregarTemas implements AppErro {
  final String mensagem;
  ErroCarregarTemas({required this.mensagem});

  @override
  String toString() {
    return "ErroCarregarTemas - $mensagem";
  }
}

class ErroAtualizarCorTemas implements AppErro {
  final String mensagem;
  ErroAtualizarCorTemas({required this.mensagem});

  @override
  String toString() {
    return "ErroAtualizarCorTemas - $mensagem";
  }
}
