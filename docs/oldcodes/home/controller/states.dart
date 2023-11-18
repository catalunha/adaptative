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
