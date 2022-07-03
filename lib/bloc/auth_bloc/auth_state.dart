part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class CheckAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class LoggedAuthState extends AuthState {
  final UserModel user;

  const LoggedAuthState(this.user);

  @override
  List<Object?> get props => [user];
}

class NotLoggedAuthState extends AuthState {}

class ErrorAuthState extends AuthState {
  final String error;

  const ErrorAuthState(this.error);

  @override
  List<Object?> get props => [error];
}
