import 'package:biomarker_demo/features/home/presentation/pages/_pages.dart';
import 'package:biomarker_demo/features/measure/domain/repositories/_repositories.dart';
import 'package:biomarker_demo/features/measure/presentation/cubit/_cubits.dart';
import 'package:biomarker_demo/features/measure/presentation/pages/_pages.dart';
import 'package:biomarker_demo/features/sessions/domain/repositories/_repositories.dart';
import 'package:biomarker_demo/features/sessions/presentation/cubit/_cubits.dart';
import 'package:biomarker_demo/features/sessions/presentation/pages/_pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Routes. Each feature page gets its own Cubit here, closed when the route
/// is popped.
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(
      path: '/measure',
      builder: (context, state) => BlocProvider(
        create: (context) =>
            MeasureCubit(RepositoryProvider.of<MeasureRepository>(context)),
        child: const MeasurePage(),
      ),
    ),
    GoRoute(
      path: '/sessions',
      builder: (context, state) => BlocProvider(
        create: (context) =>
            SessionsCubit(RepositoryProvider.of<SessionRepository>(context))
              ..load(),
        child: const SessionsPage(),
      ),
    ),
    GoRoute(
      path: '/sessions/:id',
      builder: (context, state) => BlocProvider(
        create: (context) => SessionDetailCubit(
          RepositoryProvider.of<SessionRepository>(context),
        )..load(state.pathParameters['id']!),
        child: const SessionDetailPage(),
      ),
    ),
  ],
);
