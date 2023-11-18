sealed class SplashPageState {}

final class SplashPageStateInitial extends SplashPageState {}

final class SplashPageStateLoading extends SplashPageState {}

final class SplashPageStateLoaded extends SplashPageState {}

final class SplashPageStateError extends SplashPageState {
  final String? error;

  SplashPageStateError({required this.error});
}
