import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final String apiErrorMessage;
  final bool isHidePassword;
  final bool isSuccess;

  const LoginState({
    this.isLoading = false,
    this.apiErrorMessage = '',
    this.isHidePassword = true,
    this.isSuccess = false,
  });

  copyWith({
    bool? isLoading,
    String? apiErrorMessage,
    bool? isHidePassword,
    bool? isSuccess,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      apiErrorMessage: apiErrorMessage ?? this.apiErrorMessage,
      isHidePassword: isHidePassword ?? this.isHidePassword,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    apiErrorMessage,
    isHidePassword,
    isSuccess,
  ];
}
