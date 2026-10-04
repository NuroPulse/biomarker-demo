import 'package:biomarker_demo/dsp/_dsp.dart';
import 'package:biomarker_demo/features/measure/domain/repositories/_repositories.dart';
import 'package:biomarker_demo/features/sessions/domain/repositories/_repositories.dart';
import 'package:biomarker_demo/services/logger_service.dart';
import 'package:biomarker_demo/services/router_service.dart';
import 'package:biomarker_demo/services/storage/_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.logger,
    required this.hive,
    required this.dspConfig,
    required this.sessionRepository,
    required this.measureRepository,
  });

  final LoggerService logger;
  final HiveService hive;
  final DspConfig dspConfig;
  final SessionRepository sessionRepository;
  final MeasureRepository measureRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LoggerService>.value(value: logger),
        RepositoryProvider<HiveService>.value(value: hive),
        RepositoryProvider<DspConfig>.value(value: dspConfig),
        RepositoryProvider<SessionRepository>.value(value: sessionRepository),
        RepositoryProvider<MeasureRepository>.value(value: measureRepository),
      ],
      child: MaterialApp.router(
        title: 'NuroPulse',
        theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
        routerConfig: router,
      ),
    );
  }
}
