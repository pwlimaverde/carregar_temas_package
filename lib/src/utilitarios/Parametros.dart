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

class ParametrosAtualizarCorTemas {
  final Map<String, int> cor;
  final KeyCorTema key;
  final String user;

  ParametrosAtualizarCorTemas({
    required this.cor,
    required this.key,
    required this.user,
  });
}
