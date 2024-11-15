import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(
        'REQUEST[${options.method}] => PATH: ${options.path} AND Query Paramters are : ${options.queryParameters} And headers are ${options.headers} ');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} => RESPONSE IS : ${response.data}');
    return handler.next(response);
  }
}
