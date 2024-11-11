import 'package:dartz/dartz.dart';
import 'package:perfection_webapp/core/errors/exceptions.dart';
import 'package:perfection_webapp/core/errors/faliures.dart';
import 'package:perfection_webapp/data/data_source/user_remote_data_source.dart';
import 'package:perfection_webapp/domain/entities/user_entity.dart';

import '../../core/helpers/user_adapter.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers({required int page});
}

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepositoryImpl({required UserRemoteDataSource userRemoteDataSource})
      : _userRemoteDataSource = userRemoteDataSource;
  @override
  Future<Either<Failure, List<UserEntity>>> getUsers(
      {required int page}) async {
    try {
      final usersResponse =
          await _userRemoteDataSource.getUsers(page: page); // get users reposne
      final users = usersResponse
          .map((user) => UserAdapter.fromDTO(user))
          .toList(); // clean users data
      return Right(users);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
