import 'package:perfection_webapp/core/helpers/network_exceptions_types.dart';

sealed class AppException {
  final String message;
  final int? code;

  AppException({required this.message, this.code});
}

class ServerException extends AppException {
  final NetworkExceptionType type;
  ServerException(
      {required this.type, super.message = 'Network error', super.code});
}
