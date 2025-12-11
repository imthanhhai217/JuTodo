import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String userName, password, errorMessage;
  final bool isPasswordVisible, isButtonEnable;

  const LoginState({
    this.userName = "",
    this.password = "",
    this.errorMessage = "",
    this.isPasswordVisible = false,
    this.isButtonEnable = false,
  });

  LoginState copyWith({
    String? userName,
    String? password,
    String? errorMessage,
    bool? isPasswordVisible,
    bool? isButtonEnable,
  }) {
    return LoginState(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isButtonEnable: isButtonEnable ?? this.isButtonEnable,
    );
  }

  @override
  List<Object?> get props => [
    userName,
    password,
    errorMessage,
    isPasswordVisible,
    isButtonEnable,
  ];
}
