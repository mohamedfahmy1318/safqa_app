abstract class Failures {
  final String message;
  const Failures({required this.message});
}

class ServerFailure extends Failures {
  const ServerFailure({required super.message});
}

class CacheFailure extends Failures {
  const CacheFailure({required super.message});
}

class NetworkFailure extends Failures {
  const NetworkFailure({required super.message});
}

class UnknownFailure extends Failures {
  const UnknownFailure({required super.message});
}
