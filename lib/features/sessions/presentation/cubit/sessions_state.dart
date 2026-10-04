import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/_errors.dart';
import '../../domain/entity/session_entity.dart';

part 'sessions_state.freezed.dart';

@freezed
sealed class SessionsState with _$SessionsState {
  const factory SessionsState.loading() = SessionsLoading;

  /// [actionFailure] carries an error from delete or share. The list stays on
  /// screen, and the page shows it once and then clears it.
  const factory SessionsState.loaded({
    required List<SessionEntity> sessions,
    Failure? actionFailure,
  }) = SessionsLoaded;

  const factory SessionsState.failure(Failure failure) = SessionsFailure;
}
