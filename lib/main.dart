import 'package:biomarker_demo/app.dart';
import 'package:biomarker_demo/features/measure/data/datasources/_datasources.dart';
import 'package:biomarker_demo/features/measure/data/repositories/_repositories.dart';
import 'package:biomarker_demo/features/sessions/data/datasources/_datasources.dart';
import 'package:biomarker_demo/features/sessions/data/repositories/_repositories.dart';
import 'package:biomarker_demo/services/dsp_config_loader.dart';
import 'package:biomarker_demo/services/logger_service.dart';
import 'package:biomarker_demo/services/storage/_storage.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final logger = LoggerService();
  final hive = HiveService();
  await hive.init();
  final dspConfig = await DspConfigLoader.load();

  if (!dspConfig.calibrated) {
    logger.info('DSP thresholds are not calibrated');
  }

  final sessionRepository = SessionRepositoryImpl(
    SessionLocalDatasource(hive),
    SessionFileDatasource(),
  );
  final measureRepository = MeasureRepositoryImpl(
    SensorDatasource(),
    sessionRepository,
    dspConfig,
  );

  runApp(
    App(
      logger: logger,
      hive: hive,
      dspConfig: dspConfig,
      sessionRepository: sessionRepository,
      measureRepository: measureRepository,
    ),
  );
}
