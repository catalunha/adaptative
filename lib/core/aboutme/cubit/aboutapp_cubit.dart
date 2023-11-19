import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aboutapp_state.dart';
part 'aboutapp_cubit.freezed.dart';

class AboutappCubit extends Cubit<AboutappState> {
  AboutappCubit() : super(const AboutappState.initial());

  void setLayoutSize(LayoutSize value) {
    emit(const AboutappStateLoading());
    // emit(AboutappStateLoaded(layoutSize: value));
  }
}
