import 'dart:developer';

import 'package:adaptative/pages/home/controller/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageController extends Cubit<HomePageState> {
  HomePageController() : super(HomePageState()) {
    loading();
  }
  Future<void> loading() async {
    log('+++ HomePageController.loading');
    emit(state.copyWith(status: HomePageStatus.loading));
    await Future.delayed(const Duration(seconds: 4));
    emit(state.copyWith(status: HomePageStatus.loaded));
    log('--- HomePageController.loading');
  }
}
