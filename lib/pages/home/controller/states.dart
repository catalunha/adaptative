sealed class HomePageState {}

final class HomePageStateInitial extends HomePageState {}

final class HomePageStateLoading extends HomePageState {}

final class HomePageStateLoaded extends HomePageState {}

final class HomePageStateError extends HomePageState {
  final String? error;

  HomePageStateError({required this.error});
}
