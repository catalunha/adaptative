import 'dart:developer';

import 'package:adaptative/data/repositories/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/task.dart';
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
    // await Future.delayed(const Duration(seconds: 1));

    final tasks = await _repository.list();
    emit(TaskListStateLoaded(tasks: tasks));
    log('--- TaskListController.loading');
  }

  Future<void> update(Task task) async {
    log('+++ TaskListController.loading');
    emit(TaskListStateLoading());
    // await Future.delayed(const Duration(seconds: 1));

    await _repository.upsert(task);
    loading();
    log('--- TaskListController.loading');
  }
}
