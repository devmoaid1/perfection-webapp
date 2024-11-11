import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:perfection_webapp/data/models/api_response_model.dart';
import 'package:perfection_webapp/data/models/serializable.dart';

import '../constants.dart';
import '../dependencies.dart';
import '../errors/status_code.dart';
import 'base_api.dart';
import 'dio_error_handler.dart';
import 'interceptor.dart';

class DioConsumer implements BaseApi {
  final Dio dio;

  DioConsumer({required this.dio}) {
    (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options
      ..baseUrl = AppStrings.baseUrl
      ..followRedirects = false
      ..validateStatus = ((status) {
        return status! < StatusCode.internalServerError;
      });

    dio.interceptors.add(sl<AppInterceptor>());

    if (kDebugMode) {
      dio.interceptors.add(sl<LogInterceptor>());
    }
  }

  Future<T> _errorTryCatch<T>(Future<T> Function() function) async {
    try {
      return await function();
    } catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<ApiResponse<T>> get<T extends Serializable<T>>(
      {required String url,
      Object? data,
      Map<String, dynamic>? queryParameters}) {
    return _errorTryCatch(
      () async {
        final response = await dio.get(url, queryParameters: queryParameters);
        // i want to use fromJson from T and pass it to ApiResponse

        return ApiResponse<T>.fromJson(
          json: response.data,
        );
      },
    );
  }
}
