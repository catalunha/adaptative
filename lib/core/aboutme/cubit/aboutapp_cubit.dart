import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aboutapp_state.dart';
part 'aboutapp_cubit.freezed.dart';

class AboutappCubit extends Cubit<AboutappState> {
  AboutappCubit() : super(AboutappState.initial());
}