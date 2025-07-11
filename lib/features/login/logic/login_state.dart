part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}

final class LoginUnauthorized extends LoginState {
  final String phoneNumber;

  LoginUnauthorized(this.phoneNumber);
}

final class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;

  LoginSuccess(this.loginResponse);
}
