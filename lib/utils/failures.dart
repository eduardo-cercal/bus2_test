sealed class Failures {
  final String message;

  Failures(this.message);
}

class UnexpectedFailure implements Failures {
  @override
  String get message => 'Um erro inesperado ocorreu!';
}

class ServerFailure implements Failures {
  @override
  String get message => 'Erro ao conectar-se ao servidor';
}

class NotFoundFailure implements Failures {
  @override
  String get message => 'A url chamada não foi encontrada';
}
