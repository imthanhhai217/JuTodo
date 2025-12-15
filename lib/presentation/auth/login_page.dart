import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ju_reminder/constants/constants.dart';
import 'package:ju_reminder/constants/validator.dart';
import 'package:ju_reminder/presentation/auth/bloc/auth_bloc.dart';
import 'package:ju_reminder/presentation/auth/cubit/auth_cubit.dart';
import 'package:ju_reminder/presentation/auth/login_state.dart';
import 'package:ju_reminder/presentation/common/global_loading/cubit/loading_cubit.dart';
import 'package:ju_reminder/themes/app_typography.dart';
import 'package:ju_reminder/themes/dimens.dart';

import 'bloc/auth_event.dart';
import 'bloc/auth_state.dart';

const TAG = "JuReminder: ";

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print('$TAG LoginScreen - State changed: ${state.runtimeType}');
          if (state is AuthAuthenticatedState) {
            context.read<LoadingCubit>().hideLoading();
            // Chuyển sang Home
            print('$TAG LoginScreen - Navigating to Home');
            context.pop(state.userEmail);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Đăng nhập thành công!')));
          } else if (state is AuthUnauthenticatedState) {
            context.read<LoadingCubit>().hideLoading();
            // Hiển thị lỗi
            print('$TAG LoginScreen - Login failed');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Email hoặc mật khẩu không đúng!'),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is AuthErrorState) {
            // Hiển thị lỗi
            print('$TAG LoginScreen - Error: ${state.message}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(kLoginTitle),
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppDimen.kDefaultScreenPadding),
            child: Form(
              key: _loginFormKey,
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return buildColumn(context, state);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildColumn(BuildContext context, LoginState state) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            label: Text("Username", style: AppTypography.body),
          ),
          keyboardType: TextInputType.text,
          validator: Validator.validatorEmail,
          onChanged: context.read<LoginCubit>().updateEmail,
        ),
        TextFormField(
          decoration: InputDecoration(
            label: Text("Password", style: AppTypography.body),
            suffixIcon: IconButton(
              onPressed: () {
                context.read<LoginCubit>().togglePassword();
              },
              icon: state.isPasswordVisible
                  ? Icon(Icons.visibility)
                  : Icon(Icons.visibility_off),
            ),
          ),
          keyboardType: TextInputType.text,
          obscureText: !state.isPasswordVisible,
          validator: Validator.validatorPassword,
          onChanged: context.read<LoginCubit>().updatePassword,
        ),

        const SizedBox(
          width: AppDimen.kInfinity,
          height: AppDimen.kDefaultMargin,
        ),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: state.isButtonEnable
                ? () {
                    if (_loginFormKey.currentState?.validate() == true) {
                      print('$TAG LoginScreen - Calling showLoading()');
                      context.read<LoadingCubit>().showLoading("Đang đăng nhập...");
                      print('$TAG LoginScreen - Calling AuthLoginEvent');
                      context.read<AuthBloc>().add(
                        AuthLoginEvent(
                          userName: state.userName.trim(),
                          password: state.password,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Vui lòng kiểm tra lại thông tin."),
                        ),
                      );
                    }
                  }
                : null,
            child: Text("Login", style: AppTypography.body),
          ),
        ),
      ],
    );
  }
}
