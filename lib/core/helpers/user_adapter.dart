// UserAdapter class
import '../../data/models/user_dto.dart';
import '../../domain/entities/user_entity.dart';

class UserAdapter {
  // Convert UserDTO to UserEntity
  static UserEntity fromDTO(UserDTO dto) {
    return UserEntity(
      id: dto.id,
      email: dto.email,
      fullName:
          '${dto.firstName} ${dto.lastName}', // Combine first and last name
      avatarUrl: dto.avatar,
    );
  }

  // Convert UserEntity to UserDTO (if needed)
  static UserDTO toDTO(UserEntity entity) {
    // Split full name into first and last for DTO (this is just an example)
    List<String> names = entity.fullName.split(' ');
    String firstName = names.isNotEmpty ? names[0] : '';
    String lastName = names.length > 1 ? names.sublist(1).join(' ') : '';

    return UserDTO(
      id: entity.id,
      email: entity.email,
      firstName: firstName,
      lastName: lastName,
      avatar: entity.avatarUrl,
    );
  }
}
