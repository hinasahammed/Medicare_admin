class AppException implements Exception {
  final String? message;
  final String? prefix;

  AppException([this.message, this.prefix]);

  @override
  String toString() {
    return '$prefix$message';
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, 'No Internet');
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException([String? message]) : super(message, 'Time out');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Internal server error');
}
