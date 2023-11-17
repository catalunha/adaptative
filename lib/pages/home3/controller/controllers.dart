import 'dart:developer';

import 'package:adaptative/data/repositories/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class TaskListController extends Cubit<TaskListState> {
  final TaskRepository _repository;

  TaskListController({required TaskRepository repository})
      : _repository = repository,
        super(TaskListStateInitial()) {
    loading();
  }
  Future<void> loading() async {
    log('+++ TaskListController.loading');
    emit(TaskListStateLoading());
    await Future.delayed(const Duration(seconds: 2));

    final tasks = await _repository.list();
    emit(TaskListStateLoaded(tasks: tasks));
    log('--- TaskListController.loading');
  }
}
