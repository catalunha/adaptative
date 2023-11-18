import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/task.dart';

part 'states.freezed.dart';

enum Home2PageStatus { initial, loading, loaded, error }

@freezed
abstract class Home2PageState with _$Home2PageState {
  factory Home2PageState({
    @Default(Home2PageStatus.initial) Home2PageStatus status,
    @Default('') String statusMessage,
    @Default([]) List<Task> tasks,
  }) = _Home2PageState;
}
