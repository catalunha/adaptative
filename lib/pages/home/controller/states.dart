import '../../../data/models/task.dart';

sealed class HomePageState {}

final class HomePageStateInitial extends HomePageState {}

final class HomePageStateLoading extends HomePageState {}

final class HomePageStateLoaded extends HomePageState {
  final List<Task> tasks;

  HomePageStateLoaded({required this.tasks});
}

final class HomePageStateError extends HomePageState {
  final String? error;

  HomePageStateError({required this.error});
}
