import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

enum TaskStateStatus { initial, loading, loaded, error }

@freezed
class TaskState with _$TaskState {
  factory TaskState({
    @Default(TaskStateStatus.initial) TaskStateStatus status,
    String? error,
  }) = _TaskState;
}

extension TaskStateStatusIs on TaskStateStatus {
  bool get isInitial => this == TaskStateStatus.initial;
  bool get isLoading => this == TaskStateStatus.loading;
  bool get isLoaded => this == TaskStateStatus.loaded;
  bool get isError => this == TaskStateStatus.error;
}
