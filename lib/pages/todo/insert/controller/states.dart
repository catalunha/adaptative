import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

// extension WeatherStatusX on WeatherStatus {
//   bool get isInitial => this == WeatherStatus.initial;
//   bool get isLoading => this == WeatherStatus.loading;
//   bool get isSuccess => this == WeatherStatus.success;
//   bool get isFailure => this == WeatherStatus.failure;
// }

@freezed
sealed class TaskState with _$TaskState {
  const factory TaskState.initial() = TaskStateInitial;
  const factory TaskState.loading() = TaskStateLoading;
  const factory TaskState.loaded() = TaskStateLoaded;
  const factory TaskState.error({String? error}) = TaskStateError;
}

/*
sealed class TaskState {}

final class TaskStateInitial extends TaskState {}

final class TaskStateLoading extends TaskState {}

final class TaskStateLoaded extends TaskState {}

final class TaskStateError extends TaskState {
  final String? error;

  TaskStateError({required this.error});
}
*/