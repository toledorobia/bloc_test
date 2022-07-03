part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final UserModel? user;
  const AuthState({this.user});

  @override
  List<Object?> get props => [user];
}

class CheckAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class LoggedAuthState extends AuthState {
  const LoggedAuthState({required super.user});
}

class NotLoggedAuthState extends AuthState {}

class ErrorAuthState extends AuthState {
  final String error;

  const ErrorAuthState({super.user, required this.error});

  @override
  List<Object?> get props => [super.user, error];
}
