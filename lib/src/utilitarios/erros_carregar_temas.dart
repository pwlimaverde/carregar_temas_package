import 'package:return_success_or_error/return_success_or_error.dart';

class ErroCarregarTemas implements AppError {
  String message;
  ErroCarregarTemas({required this.message});

  @override
  String toString() {
    return "ErroCarregarTemas - $message";
  }
}

class ErroCarregarConfiguracaoTemas implements AppError {
  String message;
  ErroCarregarConfiguracaoTemas({required this.message});

  @override
  String toString() {
    return "ErroCarregarTemas - $message";
  }
}

class ErroAtualizarCorTemas implements AppError {
  String message;
  ErroAtualizarCorTemas({required this.message});

  @override
  String toString() {
    return "ErroAtualizarCorTemas - $message";
  }
}
