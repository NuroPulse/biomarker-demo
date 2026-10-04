import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/strings/app_strings.dart';
import '../../../../core/widgets/_widgets.dart';
import '../../../../dsp/_dsp.dart';
import '../cubit/_cubits.dart';
import '../widgets/live_waveform.dart';
import '../widgets/measure_form.dart';
import '../widgets/result_view.dart';

/// Shows each recording state. Leaving the foreground while recording stops
/// the recording and marks it invalid (CLAUDE.md section 8).
class MeasurePage extends StatefulWidget {
  const MeasurePage({super.key});

  @override
  State<MeasurePage> createState() => _MeasurePageState();
}

class _MeasurePageState extends State<MeasurePage> with WidgetsBindingObserver {
  static const _recordingDuration = MeasureTiming.defaultRecordingDuration;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      context.read<MeasureCubit>().interrupt();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.measure)),
      body: BlocBuilder<MeasureCubit, MeasureState>(
        builder: (context, state) => _buildBody(context, state),
      ),
    );
  }

  Widget _buildBody(BuildContext context, MeasureState state) {
    final cubit = context.read<MeasureCubit>();
    final config = context.read<DspConfig>();

    return switch (state) {
      MeasureIdle() => MeasureForm(onStart: cubit.start),
      MeasureCountdown(:final secondsLeft) => _CenteredMessage(
        message: AppStrings.countdown(secondsLeft),
        actionLabel: AppStrings.cancel,
        onAction: cubit.cancel,
      ),
      MeasureRecording(:final elapsed, :final window) => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(AppStrings.recording),
          const SizedBox(height: 16),
          LiveWaveform(window: window),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: (elapsed.inMilliseconds / _recordingDuration.inMilliseconds)
                .clamp(0.0, 1.0),
          ),
        ],
      ),
      MeasureProcessing() => const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(AppStrings.processing),
          ],
        ),
      ),
      MeasureSuccess(:final result) => Column(
        children: [
          Expanded(
            child: ResultView(result: result, config: config),
          ),
          _RetryBar(onRetry: cubit.retry),
        ],
      ),
      MeasureInvalid(:final reasons) => Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                DecisionBanner(
                  status: TremorStatus.invalid,
                  calibrated: config.calibrated,
                ),
                const SizedBox(height: 16),
                for (final reason in reasons) Text('• ${_reasonText(reason)}'),
              ],
            ),
          ),
          _RetryBar(onRetry: cubit.retry),
        ],
      ),
      MeasureFailure(:final failure) => _CenteredMessage(
        message: AppStrings.failure(failure),
        actionLabel: AppStrings.retry,
        onAction: () => cubit.retry(),
      ),
    };
  }

  static String _reasonText(InvalidReason reason) {
    return switch (reason) {
      InvalidReason.sampling => AppStrings.gateSampling,
      InvalidReason.dataGap => AppStrings.gateDataGap,
      InvalidReason.flatSignal => AppStrings.gateFlatSignal,
      InvalidReason.interrupted => AppStrings.interrupted,
    };
  }
}

class _CenteredMessage extends StatelessWidget {
  const _CenteredMessage({
    required this.message,
    required this.actionLabel,
    required this.onAction,
  });

  final String message;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            TextButton(onPressed: onAction, child: Text(actionLabel)),
          ],
        ),
      ),
    );
  }
}

class _RetryBar extends StatelessWidget {
  const _RetryBar({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: FilledButton(
        onPressed: onRetry,
        child: const Text(AppStrings.retry),
      ),
    );
  }
}
