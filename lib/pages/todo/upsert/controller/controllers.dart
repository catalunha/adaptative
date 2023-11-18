import 'dart:developer';

import 'package:adaptative/data/models/task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repositories/task_repository.dart';
import 'states.dart';

class TaskController extends Cubit<TaskState> {
  final TaskRepository _repository;
  final Task? task;
  TaskController({
    required TaskRepository repository,
    required this.task,
  })  : _repository = repository,
        super(TaskStateInitial(task: task));
  Future<void> upsert({
    required String title,
    required String description,
  }) async {
    log('+++ TaskController.create');
    emit(TaskStateLoading());
    await Future.delayed(const Duration(seconds: 1));
    if (title.isNotEmpty) {
      if (task == null) {
        await _repository.upsert(Task(title: title, description: description));
      } else {
        await _repository
            .upsert(Task(id: task!.id, title: title, description: description));
      }
    }
    emit(TaskStateLoaded());
    // emit(TaskStateError(error: 'Algo deu errado'));
    log('--- TaskController.create');
  }

  Future<void> delete() async {
    log('+++ TaskController.delete');
    emit(TaskStateLoading());
    await Future.delayed(const Duration(seconds: 1));
    if (task != null) {
      await _repository.detele(task!.id!);
    }
    emit(TaskStateLoaded());
    // emit(TaskStateError(error: 'Algo deu errado'));
    log('--- TaskController.delete');
  }
}
