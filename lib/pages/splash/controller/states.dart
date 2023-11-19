import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

enum SplashPageStateStatus { initial, loading, loaded, error }

@freezed
class SplashPageState with _$SplashPageState {
  factory SplashPageState({
    @Default(SplashPageStateStatus.initial) SplashPageStateStatus status,
    String? error,
  }) = _SplashPageState;
}

extension TaskStateStatusIs on SplashPageStateStatus {
  bool get isInitial => this == SplashPageStateStatus.initial;
  bool get isLoading => this == SplashPageStateStatus.loading;
  bool get isLoaded => this == SplashPageStateStatus.loaded;
  bool get isError => this == SplashPageStateStatus.error;
}
