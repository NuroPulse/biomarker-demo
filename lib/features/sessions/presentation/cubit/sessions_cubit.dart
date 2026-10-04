import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/_errors.dart';
import '../../domain/entity/session_entity.dart';
import '../../domain/repositories/session_repository.dart';
import 'sessions_state.dart';

class SessionsCubit extends Cubit<SessionsState> {
  SessionsCubit(this._repository) : super(const SessionsState.loading());

  final SessionRepository _repository;

  Future<void> load() async {
    emit(const SessionsState.loading());
    try {
      final sessions = await _repository.getSessions();
      emit(SessionsState.loaded(sessions: sessions));
    } on Failure catch (failure) {
      emit(SessionsState.failure(failure));
    }
  }

  Future<void> delete(String id) async {
    try {
      await _repository.deleteSession(id);
    } on Failure catch (failure) {
      _showActionFailure(failure);
      return;
    }
    await load();
  }

  Future<void> share(String id) async {
    try {
      await _repository.shareSession(id);
    } on Failure catch (failure) {
      _showActionFailure(failure);
    }
  }

  void clearActionFailure() {
    final current = state;
    if (current is SessionsLoaded && current.actionFailure != null) {
      emit(SessionsState.loaded(sessions: current.sessions));
    }
  }

  void _showActionFailure(Failure failure) {
    final sessions = _currentSessions();
    emit(SessionsState.loaded(sessions: sessions, actionFailure: failure));
  }

  List<SessionEntity> _currentSessions() {
    final current = state;
    return current is SessionsLoaded ? current.sessions : const [];
  }
}
