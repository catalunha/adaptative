import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

enum LayoutSize { tiny, small, medium, large }

@freezed
class AppEnviromentState with _$AppEnviromentState {
  const factory AppEnviromentState({
    @Default(LayoutSize.tiny) LayoutSize layoutSize,
    @Default(0.0) double maxWidth,
  }) = AppEnviromentStateLoaded;
}

extension LayoutSizeIs on LayoutSize {
  bool get isTiny => this == LayoutSize.tiny;
  bool get isSmall => this == LayoutSize.small;
  bool get isMedium => this == LayoutSize.medium;
  bool get isLarge => this == LayoutSize.large;
}
