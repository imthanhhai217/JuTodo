import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_reminder/data/repositories/auth_repository.dart';
import 'package:ju_reminder/main.dart';

import '../../../bs/Basic.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitialState()) {
    on<AuthLoginEvent>(_login);
    on<AuthLogoutEvent>(_logout);
  }

  Future<void> _login(AuthLoginEvent event, Emitter<AuthState> emit) async {
    print('$TAG AuthBloc - Login started: ${event.userName}');
    try {
      await Future.delayed(
        const Duration(seconds: 3),
      ); // Simulate network delay
      final success = await repository.login(event.userName, event.password);
      print('$TAG AuthBloc - Login result: $success');

      if (success) {
        final userEmail = repository.getCurrentUser() ?? "";
        print('$TAG AuthBloc - Login successful, user: $userEmail');
        emit(AuthAuthenticatedState(userEmail: userEmail));
      } else {
        print('$TAG AuthBloc - Login failed: Invalid credentials');
        emit(AuthUnauthenticatedState());
      }
    } catch (e) {
      print('$TAG AuthBloc - Login error: $e');
      emit(AuthErrorState(message: e.toString()));
    }
  }

  Future<void> _logout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    print('$TAG AuthBloc - Logout started');
    await repository.logout();
    emit(AuthUnauthenticatedState());
  }
}
