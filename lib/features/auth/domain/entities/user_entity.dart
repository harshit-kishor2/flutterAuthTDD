import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String username;
  final String first_name;
  final String last_name;
  final String email;

  const UserEntity({
    required this.username,
    required this.first_name,
    required this.last_name,
    required this.email,
  });
  @override
  List<Object?> get props => [username, first_name, last_name, email];
}
