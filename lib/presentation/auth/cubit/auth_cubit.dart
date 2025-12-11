import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ju_reminder/main.dart';
import 'package:ju_reminder/presentation/auth/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void updateEmail(String email) {
    print('$TAG LoginCubit - Update email: $email');
    emit(state.copyWith(
      userName: email,
      isButtonEnable: _validateInfo(email, state.password),
    ));
  }

  void updatePassword(String password) {
    print('$TAG LoginCubit - Update password: ${password.length} chars');
    emit(
      state.copyWith(
        password: password,
        isButtonEnable: _validateInfo(state.userName, password),
      ),
    );
  }

  void togglePassword() {
    print('$TAG LoginCubit - Toggle password visibility');
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  bool _validateInfo(String userName, String password) {
    final isValid = userName.isNotEmpty && password.isNotEmpty && password.length >= 6;
    print('$TAG LoginCubit - Validate: email=$userName, pass length=${password.length}, isValid=$isValid');
    return isValid;
  }
}
