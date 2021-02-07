import 'package:retorno_sucesso_ou_erro_package/retorno_sucesso_ou_erro_package.dart';

class ErrorCarregarTemas implements AppErro {
  final String mensagem;
  ErrorCarregarTemas({required this.mensagem});

  @override
  String toString() {
    return "ErrorConeccao - $mensagem";
  }
}
