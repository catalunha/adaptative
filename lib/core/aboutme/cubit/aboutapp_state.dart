part of 'aboutapp_cubit.dart';

enum LayoutSize { small, medium, large, undefined }

@freezed
class AboutappState with _$AboutappState {
  const factory AboutappState.initial() = AboutappStateInitial;
  const factory AboutappState.loading() = AboutappStateLoading;
  const factory AboutappState.loaded({
    @Default(LayoutSize.undefined) LayoutSize layoutSize,
    @Default(0.0) double maxWidth,
  }) = AboutappStateLoaded;
  const factory AboutappState.error({String? error}) = AboutappStateError;
}
