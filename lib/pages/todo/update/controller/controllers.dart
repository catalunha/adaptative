import 'dart:developer';

import 'package:adaptative/data/models/task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repositories/task_repository.dart';
import 'states.dart';

class TaskUpdateCubit extends Cubit<TaskState> {
  final TaskRepository _repository;
  final Task? task;
  TaskUpdateCubit({
    required TaskRepository repository,
    required this.task,
  })  : _repository = repository,
        super(TaskStateInitial(task: task));
  Future<void> update({
    required String title,
    required String description,
  }) async {
    log('+++ TaskUpdateCubit.create');
    emit(TaskStateLoading());
    await Future.delayed(const Duration(seconds: 1));
    if (title.isNotEmpty) {
      await _repository
          .upsert(Task(id: task!.id, title: title, description: description));
    }
    emit(TaskStateLoaded());
    // emit(TaskStateError(error: 'Algo deu errado'));
    log('--- TaskUpdateCubit.create');
  }

  Future<void> delete() async {
    log('+++ TaskUpdateCubit.delete');
    emit(TaskStateLoading());
    await Future.delayed(const Duration(seconds: 1));
    await _repository.detele(task!.id!);
    emit(TaskStateLoaded());
    // emit(TaskStateError(error: 'Algo deu errado'));
    log('--- TaskUpdateCubit.delete');
  }
}
