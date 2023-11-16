// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'states.freezed.dart';

// enum SplashPageStatus { initial, loading, loaded, error }

// @freezed
// abstract class SplashPageState with _$SplashPageState {
//   factory SplashPageState({
//     @Default(SplashPageStatus.initial) SplashPageStatus status,
//     @Default('') String statusMessage,
//   }) = _SplashPageState;
// }

sealed class SplashPageState {}

final class SplashPageStateInitial extends SplashPageState {}

final class SplashPageStateLoading extends SplashPageState {}

final class SplashPageStateLoaded extends SplashPageState {}

final class SplashPageStateError extends SplashPageState {
  final String? error;

  SplashPageStateError({required this.error});
}
