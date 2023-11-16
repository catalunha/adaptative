import 'dart:developer';

import 'package:adaptative/pages/home/controller/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageController extends Cubit<HomePageState> {
  HomePageController() : super(HomePageStateInitial()) {
    loading();
  }
  Future<void> loading() async {
    log('+++ HomePageController.loading');
    emit(HomePageStateLoading());
    await Future.delayed(const Duration(seconds: 4));
    // emit(HomePageStateError(error: 'Falha ao carregar'));
    emit(HomePageStateLoaded());
    log('--- HomePageController.loading');
  }
}
