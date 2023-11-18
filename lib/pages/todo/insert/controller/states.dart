sealed class TaskState {}

final class TaskStateInitial extends TaskState {}

final class TaskStateLoading extends TaskState {}

final class TaskStateLoaded extends TaskState {}

final class TaskStateError extends TaskState {
  final String? error;

  TaskStateError({required this.error});
}
