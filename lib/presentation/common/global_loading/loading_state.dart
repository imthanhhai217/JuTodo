abstract class LoadingState {}

class Loading extends LoadingState {
  String? message;

  Loading([this.message]);
}

class Hide extends LoadingState {}
