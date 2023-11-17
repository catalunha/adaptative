import 'dart:developer';

import 'package:adaptative/pages/splash/controller/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPageController extends Cubit<SplashPageState> {
  SplashPageController() : super(SplashPageStateInitial()) {
    loading();
  }
  Future<void> loading() async {
    log('+++ SplashPageController.loading');
    emit(SplashPageStateLoading());
    await Future.delayed(const Duration(seconds: 2));
    // emit(SplashPageStateError(error: 'Falha ao carregar'));
    emit(SplashPageStateLoaded());
    log('--- SplashPageController.loading');
  }
}
