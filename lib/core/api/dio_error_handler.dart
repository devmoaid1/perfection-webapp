import 'package:dio/dio.dart';

import '../errors/exceptions.dart';
import '../helpers/network_exceptions_types.dart';

class DioErrorHandler {
  const DioErrorHandler._();

  static AppException handle(dynamic e) {
    if (e is DioException) {
      return _handleDioError(e);
    } else {
      return ServerException(
        type: NetworkExceptionType.unknown,
      );
    }
  }

  static AppException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.badResponse:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ServerException(
          type: NetworkExceptionType.connectionTimeout,
          code: error.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return ServerException(type: NetworkExceptionType.cancel);
      case DioExceptionType.connectionError:
        return ServerException(type: NetworkExceptionType.noInternetConnection);
      case DioExceptionType.badCertificate:
        return ServerException(type: NetworkExceptionType.badCertificate);
      case DioExceptionType.unknown:
        return ServerException(type: NetworkExceptionType.unknown);
      default:
        return ServerException(type: NetworkExceptionType.unknown);
    }
  }
}
