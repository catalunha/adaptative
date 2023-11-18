import 'dart:developer';

import 'package:adaptative/data/repositories/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class HomePageController extends Cubit<HomePageState> {
  final TaskRepository _repository;

  HomePageController({required TaskRepository repository})
      : _repository = repository,
        super(HomePageStateInitial()) {
    loading();
  }
  Future<void> loading() async {
    log('+++ HomePageController.loading');
    emit(HomePageStateLoading());
    await Future.delayed(const Duration(seconds: 2));

    final tasks = await _repository.list();
    emit(HomePageStateLoaded(tasks: tasks));
    log('--- HomePageController.loading');
  }
}
