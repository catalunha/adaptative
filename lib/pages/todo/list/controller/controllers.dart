import 'dart:developer';

import 'package:adaptative/data/repositories/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/task.dart';
import 'states.dart';

class TaskListController extends Cubit<TaskListState> {
  final TaskRepository _repository;

  TaskListController({required TaskRepository repository})
      : _repository = repository,
        super(TaskListState()) {
    loading();
  }
  Future<void> loading() async {
    log('+++ TaskListController.loading');
    emit(state.copyWith(status: TaskListStateStatus.loading));
    // await Future.delayed(const Duration(seconds: 1));

    final tasks = await _repository.list();
    emit(state.copyWith(
      status: TaskListStateStatus.loading,
      tasks: tasks,
    ));
    log('--- TaskListController.loading');
  }

  Future<void> update(Task task) async {
    log('+++ TaskListController.loading');
    emit(state.copyWith(status: TaskListStateStatus.loading));
    // await Future.delayed(const Duration(seconds: 1));

    await _repository.upsert(task);
    loading();
    log('--- TaskListController.loading');
  }
}
