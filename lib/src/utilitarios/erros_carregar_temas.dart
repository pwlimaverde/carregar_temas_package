import 'package:return_success_or_error/return_success_or_error.dart';

class ErroCarregarTemas implements AppError {
  final String mensagem;
  ErroCarregarTemas({required this.mensagem});

  @override
  String toString() {
    return "ErroCarregarTemas - $mensagem";
  }
}

class ErroCarregarConfiguracaoTemas implements AppError {
  final String mensagem;
  ErroCarregarConfiguracaoTemas({required this.mensagem});

  @override
  String toString() {
    return "ErroCarregarTemas - $mensagem";
  }
}

class ErroAtualizarCorTemas implements AppError {
  final String mensagem;
  ErroAtualizarCorTemas({required this.mensagem});

  @override
  String toString() {
    return "ErroAtualizarCorTemas - $mensagem";
  }
}
