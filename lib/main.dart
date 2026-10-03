import 'package:biomarker_demo/app.dart';
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

  runApp(App(logger: logger, hive: hive, dspConfig: dspConfig));
}
