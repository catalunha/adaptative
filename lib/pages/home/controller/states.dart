// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'states.freezed.dart';

// enum HomePageStatus { initial, loading, loaded, error }

// @freezed
// abstract class HomePageState with _$HomePageState {
//   factory HomePageState({
//     @Default(HomePageStatus.initial) HomePageStatus status,
//     @Default('') String statusMessage,
//   }) = _HomePageState;
// }

sealed class HomePageState {}

final class HomePageStateInitial extends HomePageState {}

final class HomePageStateLoading extends HomePageState {}

final class HomePageStateLoaded extends HomePageState {}

final class HomePageStateError extends HomePageState {
  final String? error;

  HomePageStateError({required this.error});
}
