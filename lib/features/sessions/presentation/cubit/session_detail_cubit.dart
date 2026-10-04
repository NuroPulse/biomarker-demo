import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/_errors.dart';
import '../../domain/repositories/session_repository.dart';
import 'session_detail_state.dart';

class SessionDetailCubit extends Cubit<SessionDetailState> {
  SessionDetailCubit(this._repository)
    : super(const SessionDetailState.loading());

  final SessionRepository _repository;

  Future<void> load(String id) async {
    emit(const SessionDetailState.loading());
    try {
      final session = await _repository.getSession(id);
      emit(SessionDetailState.loaded(session: session));
    } on Failure catch (failure) {
      emit(SessionDetailState.failure(failure));
    }
  }

  Future<void> share(String id) async {
    final current = state;
    if (current is! SessionDetailLoaded) return;
    try {
      await _repository.shareSession(id);
    } on Failure catch (failure) {
      emit(
        SessionDetailState.loaded(
          session: current.session,
          actionFailure: failure,
        ),
      );
    }
  }

  void clearActionFailure() {
    final current = state;
    if (current is SessionDetailLoaded && current.actionFailure != null) {
      emit(SessionDetailState.loaded(session: current.session));
    }
  }
}
