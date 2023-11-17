import '../../../../data/models/task.dart';

sealed class TaskState {}

final class TaskStateInitial extends TaskState {
  final Task? task;

  TaskStateInitial({required this.task});
}

final class TaskStateLoading extends TaskState {}

final class TaskStateLoaded extends TaskState {
  // final Task task;

  // TaskStateLoaded({required this.task});
}

final class TaskStateError extends TaskState {
  final String? error;

  TaskStateError({required this.error});
}
