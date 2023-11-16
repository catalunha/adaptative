import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

enum HomePageStatus { initial, loading, loaded, error }

@freezed
abstract class HomePageState with _$HomePageState {
  factory HomePageState({
    @Default(HomePageStatus.initial) HomePageStatus status,
    @Default('') String statusMessage,
  }) = _HomePageState;
}
