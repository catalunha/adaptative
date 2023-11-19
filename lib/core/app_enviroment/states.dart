import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

enum LayoutSize { undefined, small, medium, large }

@freezed
class AppEnviromentState with _$AppEnviromentState {
  const factory AppEnviromentState({
    @Default(LayoutSize.undefined) LayoutSize layoutSize,
    @Default(0.0) double maxWidth,
  }) = AppEnviromentStateLoaded;
}
