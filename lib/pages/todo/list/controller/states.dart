import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/task.dart';

part 'states.freezed.dart';

enum TaskListStateStatus { initial, loading, loaded, error }

@freezed
class TaskListState with _$TaskListState {
  factory TaskListState({
    @Default(TaskListStateStatus.initial) TaskListStateStatus status,
    String? error,
    @Default([]) List<Task> tasks,
  }) = _TaskListState;
}

extension TaskStateStatusIs on TaskListStateStatus {
  bool get isInitial => this == TaskListStateStatus.initial;
  bool get isLoading => this == TaskListStateStatus.loading;
  bool get isLoaded => this == TaskListStateStatus.loaded;
  bool get isError => this == TaskListStateStatus.error;
}
