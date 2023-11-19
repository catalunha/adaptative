import 'dart:developer';

import 'package:adaptative/pages/splash/controller/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPageController extends Cubit<SplashPageState> {
  SplashPageController() : super(SplashPageState()) {
    loading();
  }
  Future<void> loading() async {
    log('+++ SplashPageController.loading');
    emit(state.copyWith(status: SplashPageStateStatus.loading));
    await Future.delayed(const Duration(seconds: 1));
    // emit(SplashPageStateError(error: 'Falha ao carregar'));
    emit(state.copyWith(status: SplashPageStateStatus.loaded));
    log('--- SplashPageController.loading');
  }
}
