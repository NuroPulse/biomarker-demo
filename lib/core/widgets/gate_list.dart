import 'package:flutter/material.dart';

import '../../dsp/_dsp.dart';
import '../strings/app_strings.dart';

/// Pass or fail per quality-gate check.
class GateList extends StatelessWidget {
  const GateList({super.key, required this.gates});

  final List<GateResult> gates;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final gate in gates)
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              gate.passed ? Icons.check_circle_outline : Icons.cancel_outlined,
              color: gate.passed
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.error,
            ),
            title: Text(_label(gate.check)),
          ),
      ],
    );
  }

  static String _label(GateCheck check) {
    return switch (check) {
      GateCheck.sampling => AppStrings.gateSampling,
      GateCheck.dataGap => AppStrings.gateDataGap,
      GateCheck.flatSignal => AppStrings.gateFlatSignal,
    };
  }
}
