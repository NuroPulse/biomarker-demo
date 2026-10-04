import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/_errors.dart';
import '../../domain/entity/session_entity.dart';

part 'session_detail_state.freezed.dart';

@freezed
sealed class SessionDetailState with _$SessionDetailState {
  const factory SessionDetailState.loading() = SessionDetailLoading;

  const factory SessionDetailState.loaded({
    required SessionEntity session,
    Failure? actionFailure,
  }) = SessionDetailLoaded;

  const factory SessionDetailState.failure(Failure failure) =
      SessionDetailFailure;
}
