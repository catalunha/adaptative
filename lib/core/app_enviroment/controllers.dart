import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class AppEnviromentCubit extends Cubit<AppEnviromentState> {
  AppEnviromentCubit() : super(const AppEnviromentState());

  void setLayoutSize(LayoutSize value) {
    emit(state.copyWith(layoutSize: value));
  }

  void setMaxWidth(double value) {
    emit(state.copyWith(maxWidth: value));
  }
}
