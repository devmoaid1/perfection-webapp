import 'package:perfection_webapp/data/models/api_response_model.dart';
import 'package:perfection_webapp/data/models/serializable.dart';

abstract interface class BaseApi {
  Future<ApiResponse<T>> get<T>(
      {required String url,
      Object? data,
      Map<String, dynamic>? queryParameters});
}
