import 'serializable.dart';
import 'support_dto.dart';

class ApiResponse<T extends Serializable<T>> {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<T> data;
  final Support? support;

  ApiResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    required this.data,
    this.support,
  });

  // Factory constructor to parse JSON
  factory ApiResponse.fromJson({
    required Map<String, dynamic> json,
  }) {
    // Check if `data` is a list or a single object
    List<T>? parsedData;

    if (json['data'] is List) {
      // If `data` is a list, map each item to T
      parsedData = (json['data'] as List)
          .map((item) => Serializable.fromJson<T>(item as Map<String, dynamic>))
          .toList();
    } else if (json['data'] is Map<String, dynamic>) {
      // If `data` is a single object, wrap it in a list
      parsedData = [
        Serializable.fromJson<T>(json['data'] as Map<String, dynamic>)
      ];
    } else {
      // If `data` is neither a list nor an object, handle it accordingly (optional)
      parsedData = [];
    }

    return ApiResponse<T>(
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      total: json['total'] as int,
      totalPages: json['total_pages'] as int,
      data: parsedData,
      support: Support.fromJson(json['support'] as Map<String, dynamic>),
    );
  }
}
