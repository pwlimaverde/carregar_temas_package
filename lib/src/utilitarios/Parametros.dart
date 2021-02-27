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

enum KeyCorTema {
  primary,
  accent,
}
