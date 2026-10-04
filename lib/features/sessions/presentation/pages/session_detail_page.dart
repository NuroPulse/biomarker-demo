import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/strings/app_strings.dart';
import '../../../../core/widgets/_widgets.dart';
import '../../../../dsp/_dsp.dart';
import '../cubit/_cubits.dart';
import '../widgets/_widgets.dart';

/// One saved session: decision, features, gates, and metadata.
class SessionDetailPage extends StatelessWidget {
  const SessionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.sessionDetail)),
      body: BlocConsumer<SessionDetailCubit, SessionDetailState>(
        listener: (context, state) {
          if (state is SessionDetailLoaded && state.actionFailure != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppStrings.failure(state.actionFailure!))),
            );
            context.read<SessionDetailCubit>().clearActionFailure();
          }
        },
        builder: (context, state) => switch (state) {
          SessionDetailLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
          SessionDetailFailure(:final failure) => Center(
            child: Text(
              AppStrings.failure(failure),
              textAlign: TextAlign.center,
            ),
          ),
          SessionDetailLoaded(:final session) => ListView(
            padding: const EdgeInsets.all(16),
            children: [
              DecisionBanner(
                status: session.result.status,
                calibrated: context.read<DspConfig>().calibrated,
              ),
              const SizedBox(height: 16),
              SessionMetadataCard(session: session),
              const SizedBox(height: 16),
              if (session.result.features != null) ...[
                FeatureTable(features: session.result.features!),
                const SizedBox(height: 16),
              ],
              Text(
                AppStrings.qualityGates,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              GateList(gates: session.result.gates),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () =>
                    context.read<SessionDetailCubit>().share(session.id),
                icon: const Icon(Icons.share),
                label: const Text(AppStrings.export),
              ),
            ],
          ),
        },
      ),
    );
  }
}
