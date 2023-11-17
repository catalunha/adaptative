import 'dart:developer';

import 'package:adaptative/data/repositories/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class Home2PageController extends Cubit<Home2PageState> {
  final TaskRepository _repository;

  Home2PageController({required TaskRepository repository})
      : _repository = repository,
        super(Home2PageState()) {
    loading();
  }
  Future<void> loading() async {
    log('+++ Home2PageController.loading');
    emit(state.copyWith(status: Home2PageStatus.initial));
    await Future.delayed(const Duration(seconds: 2));

    final tasks = await _repository.list();
    emit(state.copyWith(status: Home2PageStatus.initial, tasks: tasks));
    log('--- Home2PageController.loading');
  }
}
