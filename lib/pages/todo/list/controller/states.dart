import '../../../../data/models/task.dart';

sealed class TaskListState {}

final class TaskListStateInitial extends TaskListState {}

final class TaskListStateLoading extends TaskListState {}

final class TaskListStateLoaded extends TaskListState {
  final List<Task> tasks;

  TaskListStateLoaded({required this.tasks});
}

final class TaskListStateError extends TaskListState {
  final String? error;

  TaskListStateError({required this.error});
}
