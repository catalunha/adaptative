part of 'aboutapp_cubit.dart';

@freezed
class AboutappState with _$AboutappState {
  const factory AboutappState.initial() = AboutappStateInitial;
  const factory AboutappState.loading() = AboutappStateLoading;
  const factory AboutappState.loaded() = AboutappStateLoaded;
  const factory AboutappState.error({String? error}) = AboutappStateError;
}
