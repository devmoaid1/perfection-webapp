import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/repositories/user_repository.dart';
import '../../../../domain/entities/user_entity.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UserRepository _userRepository; // inject UserRepository
  UsersCubit(this._userRepository) : super(const UsersState());

  void fetchUsers(int page) async {
    final users =
        await _userRepository.getUsers(page: page); // get users from repository
    users.fold(
        (failure) => emit(state.copyWith(
            status: Status.error, errorMessage: failure.message)),
        (users) => emit(state.copyWith(
            status: Status.success,
            users: [...state.users, ...users],
            currentPage: page)));
  }

  void loadMore() {
    final page = state.currentPage + 1;
    print("state is $state");
    emit(state.copyWith(
      status: Status.loading,
    ));
    fetchUsers(page);
  }
}
