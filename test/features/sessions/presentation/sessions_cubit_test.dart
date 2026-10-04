import 'package:bloc_test/bloc_test.dart';
import 'package:biomarker_demo/core/errors/_errors.dart';
import 'package:biomarker_demo/features/sessions/domain/repositories/session_repository.dart';
import 'package:biomarker_demo/features/sessions/presentation/cubit/_cubits.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../support/session_fixtures.dart';

class MockSessionRepository extends Mock implements SessionRepository {}

void main() {
  late MockSessionRepository repository;

  setUp(() {
    repository = MockSessionRepository();
  });

  group('load', () {
    blocTest<SessionsCubit, SessionsState>(
      'emits loaded sessions',
      build: () {
        when(
          () => repository.getSessions(),
        ).thenAnswer((_) async => [sessionFixture()]);
        return SessionsCubit(repository);
      },
      act: (cubit) => cubit.load(),
      expect: () => [
        isA<SessionsLoading>(),
        isA<SessionsLoaded>().having((s) => s.sessions.length, 'count', 1),
      ],
    );

    blocTest<SessionsCubit, SessionsState>(
      'emits failure when the repository fails',
      build: () {
        when(
          () => repository.getSessions(),
        ).thenThrow(const StorageFailure('box closed'));
        return SessionsCubit(repository);
      },
      act: (cubit) => cubit.load(),
      expect: () => [isA<SessionsLoading>(), isA<SessionsFailure>()],
    );
  });

  group('delete', () {
    blocTest<SessionsCubit, SessionsState>(
      'reloads the list after a successful delete',
      build: () {
        when(() => repository.deleteSession(any())).thenAnswer((_) async {});
        when(() => repository.getSessions()).thenAnswer((_) async => []);
        return SessionsCubit(repository);
      },
      act: (cubit) => cubit.delete('session-1'),
      verify: (_) {
        verify(() => repository.deleteSession('session-1')).called(1);
        verify(() => repository.getSessions()).called(1);
      },
    );

    blocTest<SessionsCubit, SessionsState>(
      'keeps the list and reports the error when delete fails',
      build: () {
        when(
          () => repository.getSessions(),
        ).thenAnswer((_) async => [sessionFixture()]);
        when(
          () => repository.deleteSession(any()),
        ).thenThrow(const StorageFailure('disk full'));
        return SessionsCubit(repository);
      },
      seed: () => SessionsState.loaded(sessions: [sessionFixture()]),
      act: (cubit) => cubit.delete('session-1'),
      expect: () => [
        isA<SessionsLoaded>()
            .having((s) => s.sessions.length, 'kept', 1)
            .having((s) => s.actionFailure, 'failure', isA<StorageFailure>()),
      ],
    );
  });

  group('share', () {
    blocTest<SessionsCubit, SessionsState>(
      'reports ExportFailure without losing the list',
      build: () {
        when(
          () => repository.shareSession(any()),
        ).thenThrow(const ExportFailure('share unavailable'));
        return SessionsCubit(repository);
      },
      seed: () => SessionsState.loaded(sessions: [sessionFixture()]),
      act: (cubit) => cubit.share('session-1'),
      expect: () => [
        isA<SessionsLoaded>()
            .having((s) => s.sessions.length, 'kept', 1)
            .having((s) => s.actionFailure, 'failure', isA<ExportFailure>()),
      ],
    );
  });

  blocTest<SessionsCubit, SessionsState>(
    'clearActionFailure removes the one-time error',
    build: () => SessionsCubit(repository),
    seed: () => SessionsState.loaded(
      sessions: [sessionFixture()],
      actionFailure: const ExportFailure('x'),
    ),
    act: (cubit) => cubit.clearActionFailure(),
    expect: () => [
      isA<SessionsLoaded>().having((s) => s.actionFailure, 'failure', isNull),
    ],
  );
}
