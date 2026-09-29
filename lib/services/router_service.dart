import 'package:biomarker_demo/features/home/presentation/pages/_pages.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [GoRoute(path: "/", builder: (context, state) => const HomePage())],
);
