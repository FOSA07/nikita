class Failure {
  final String message;
  final int? code;
  final Object? exception;

  Failure(this.message, {this.code, this.exception});

  @override
  String toString() => 'Failure(message: $message, code: $code, exception: $exception)';
}
