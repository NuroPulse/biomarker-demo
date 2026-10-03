import 'package:biomarker_demo/dsp/_dsp.dart';
import 'package:biomarker_demo/services/logger_service.dart';
import 'package:biomarker_demo/services/router_service.dart';
import 'package:biomarker_demo/services/storage/_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Root widget. Dependencies are wired here with plain RepositoryProvider
/// (CLAUDE.md section 2): no service locator.
class App extends StatelessWidget {
  const App({
    super.key,
    required this.logger,
    required this.hive,
    required this.dspConfig,
  });

  final LoggerService logger;
  final HiveService hive;
  final DspConfig dspConfig;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LoggerService>.value(value: logger),
        RepositoryProvider<HiveService>.value(value: hive),
        RepositoryProvider<DspConfig>.value(value: dspConfig),
      ],
      child: MaterialApp.router(routerConfig: router),
    );
  }
}
