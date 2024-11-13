import 'package:perfection_webapp/core/constants.dart';

import '../../core/api/base_api.dart';

import '../models/api_response_model.dart';
import '../models/user_dto.dart';

abstract class UserRemoteDataSource {
  Future<List<UserDTO>> getUsers({required int page});
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final BaseApi _baseApi;

  UserRemoteDataSourceImpl({required BaseApi baseApi}) : _baseApi = baseApi;
  @override
  Future<List<UserDTO>> getUsers({required int page}) async {
    final ApiResponse<UserDTO> response = await _baseApi.get<UserDTO>(
        fromJson: UserDTO.fromJson,
        url: "${AppStrings.baseUrl}users",
        queryParameters: {"page": page});
    final users = response.data.map((user) => user).toList();
    return users;
  }
}
