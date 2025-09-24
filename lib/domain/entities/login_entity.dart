import 'package:equatable/equatable.dart';

//  final int id;
//   final String username;
//   final String email;
//   final String firstName;
//   final String lastName;
//   final String gender;
//   final String image;
//   final String accessToken;
//   final String refreshToken;

class LoginEntity extends Equatable {
  final int id;
  final String fullName;
  final String email;
  final String accessToken;
  final String refreshToken;

  const LoginEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [id, fullName, email, accessToken, refreshToken];
}
