import 'package:return_success_or_error/return_success_or_error.dart';

enum KeyCorTema {
  primary,
  accent,
}

extension KeyCorTemaExt on KeyCorTema {
  String get descricao {
    switch (this) {
      case KeyCorTema.primary:
        return "primary";
      case KeyCorTema.accent:
        return "accent";
    }
  }
}

class ParametrosAtualizarCorTemas implements ParametersReturnResult {
  final Map<String, int> cor;
  final KeyCorTema key;
  final String user;
  final AppError error;

  ParametrosAtualizarCorTemas({
    required this.cor,
    required this.key,
    required this.user,
    required this.error,
  });
}
