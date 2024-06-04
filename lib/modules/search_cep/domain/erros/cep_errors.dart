class CepInfraException {
  final String message = 'Ocorreu um erro desconhecido, tente novamente.';
  final StackTrace? stackTrace;
  final Object exception;

  CepInfraException(this.exception, [this.stackTrace]);
}
