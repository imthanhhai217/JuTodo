import 'package:flutter_bloc/flutter_bloc.dart';

import '../loading_state.dart';

class LoadingCubit extends Cubit<LoadingState> {
  LoadingCubit() : super(Hide());

  void showLoading([String? loadingName]) {
    print(
      'LoadingCubit: showLoading() ${loadingName ?? ""}called, emitting true',
    );
    emit(Loading(loadingName));
  }

  void hideLoading() {
    print('LoadingCubit: hideLoading() called, emitting false');
    emit(Hide());
  }
}
