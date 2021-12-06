import 'package:equatable/equatable.dart';
import 'package:qr_code/features/auth/data/models/register_model.dart';

class LoginEnity extends Equatable {
  final UserModel userDetails;
  final String token;

  const LoginEnity({required this.userDetails, required this.token});

  @override
  List<Object?> get props => [userDetails, token];
}
