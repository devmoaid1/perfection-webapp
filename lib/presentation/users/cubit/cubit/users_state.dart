part of 'users_cubit.dart';

// Enum to represent different status states
enum Status { error, loading, success }

class UsersState extends Equatable {
  final Status status;
  final List<UserEntity> users;
  final int currentPage;

  final String? errorMessage;

  const UsersState({
    this.status = Status.loading,
    this.users = const [],
    this.currentPage = 1,
    this.errorMessage,
  });

  // copyWith method to create a new state with modified values
  UsersState copyWith({
    Status? status,
    List<UserEntity>? users,
    int? currentPage,
    int? totalPages,
    String? errorMessage,
  }) {
    return UsersState(
      status: status ?? this.status,
      users: users ?? this.users,
      currentPage: currentPage ?? this.currentPage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, users, currentPage, errorMessage];
}
