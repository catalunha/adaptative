import 'dart:developer';

import 'package:adaptative/data/models/task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repositories/task_repository.dart';
import 'states.dart';
/*
class TaskInsertCubit extends Cubit<TaskState> {
  final TaskRepository _repository;
  TaskInsertCubit({
    required TaskRepository repository,
  })  : _repository = repository,
        super(TaskStateInitial());
  Future<void> insert({
    required String title,
    required String description,
  }) async {
    log('+++ TaskInsertCubit.create');
    emit(TaskStateLoading());
    await Future.delayed(const Duration(seconds: 1));
    if (title.isNotEmpty) {
      await _repository.upsert(Task(title: title, description: description));
    }
    emit(TaskStateLoaded());
    // emit(TaskStateError(error: 'Algo deu errado'));
    log('--- TaskInsertCubit.create');
  }
}
*/

class TaskInsertCubit extends Cubit<TaskState> {
  final TaskRepository _repository;
  TaskInsertCubit({
    required TaskRepository repository,
  })  : _repository = repository,
        super(TaskState());
  Future<void> insert({
    required String title,
    required String description,
  }) async {
    log('+++ TaskInsertCubit.create');
    emit(state.copyWith(status: TaskStateStatus.loading));
    await Future.delayed(const Duration(seconds: 1));
    if (title.isNotEmpty) {
      await _repository.upsert(Task(title: title, description: description));
    }
    emit(state.copyWith(status: TaskStateStatus.loaded));
    // emit(TaskStateError(error: 'Algo deu errado'));
    log('--- TaskInsertCubit.create');
  }
}
