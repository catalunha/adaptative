import '../../../data/models/task.dart';

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


/*
sealed class AttendanceState {}
final class AttendanceStateInitial extends AttendanceState {}
final class AttendanceStateLoading extends AttendanceState {}
final class AttendanceStateLoaded extends AttendanceState {
  final List<String> attendance;
  AttendanceStateLoaded({required this.attendance});
}
final class AttendanceStateError extends AttendanceState {
  final String? error;
  AttendanceStateError({required this.error});
}

sealed class ProceduresState {}
final class ProceduresStateInitial extends ProceduresState {}
final class ProceduresStateLoading extends ProceduresState {}
final class ProceduresStateLoaded extends ProceduresState {
  final List<String> profissionals;
  final List<String> procedures;
  ProceduresStateLoaded({required this.profissionals,required this.procedures});
}
final class ProceduresStateError extends ProceduresState {
  final String? error;
  ProceduresStateError({required this.error});
}
*/
