import 'package:bloc/bloc.dart';
import 'package:bloc_test/models/user_model.dart';
import 'package:bloc_test/resources/storage_service.dart';
import 'package:bloc_test/resources/users_repository.dart';
import 'package:equatable/equatable.dart';

part "auth_event.dart";
part "auth_state.dart";

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final StorageService storageService;
  final UsersRepository usersRepository;

  AuthBloc({required this.storageService, required this.usersRepository})
      : super(CheckAuthState()) {
    on<CheckAuthEvent>((event, emit) async {
      try {
        await Future.delayed(const Duration(seconds: 2));

        UserModel user = _createMockUser();
        String? apiKey = await storageService.read("api_key");

        if (apiKey == null || apiKey != user.email) {
          emit(NotLoggedAuthState());
        } else {
          emit(LoggedAuthState(user));
        }
      } catch (e) {
        emit(ErrorAuthState(e.toString()));
      }
    });

    on<LoginAuthEvent>((event, emit) async {
      try {
        emit(LoadingAuthState());
        await Future.delayed(const Duration(seconds: 2));

        UserModel user = _createMockUser();
        if (event.email == user.email && event.password == user.password) {
          UserModel user = _createMockUser();

          await storageService.write("api_key", user.email);
          emit(LoggedAuthState(user));
        } else {
          emit(const ErrorAuthState("Email or password invalid."));
        }
      } catch (e) {
        emit(ErrorAuthState(e.toString()));
      }
    });

    on<LogoutAuthEvent>((event, emit) async {
      try {
        await storageService.delete("api_key");
        emit(NotLoggedAuthState());
      } catch (e) {
        emit(ErrorAuthState(e.toString()));
      }
    });
  }

  UserModel _createMockUser() {
    return UserModel(
      id: 1,
      username: "prueba",
      email: "prueba@gmail.com",
      name: "Usuario de Prueba",
      password: "Qwerty123",
    );
  }
}
