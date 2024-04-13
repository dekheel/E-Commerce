class FailuresEntity {
  String? errorMessage;

  FailuresEntity({required this.errorMessage});
}

class ServerError extends FailuresEntity {
  ServerError({required super.errorMessage});
}

class NetworkError extends FailuresEntity {
  NetworkError({required super.errorMessage});
}
