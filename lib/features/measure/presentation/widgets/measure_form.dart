import 'package:flutter/material.dart';

import '../../../../core/strings/app_strings.dart';
import '../../../sessions/domain/entity/session_condition.dart';
import '../../../sessions/domain/entity/session_hand.dart';
import '../../../sessions/domain/entity/session_labels.dart';

/// Labels are required before Start. Subject code, hand, and condition are
/// mandatory, because unlabeled sessions are useless for calibration.
class MeasureForm extends StatefulWidget {
  const MeasureForm({super.key, required this.onStart});

  final void Function(SessionLabels labels) onStart;

  @override
  State<MeasureForm> createState() => _MeasureFormState();
}

class _MeasureFormState extends State<MeasureForm> {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _repetitionController = TextEditingController(text: '1');
  final _simulatedController = TextEditingController();
  final _notesController = TextEditingController();

  SessionHand _hand = SessionHand.right;
  SessionCondition _condition = SessionCondition.rest;

  @override
  void dispose() {
    _subjectController.dispose();
    _repetitionController.dispose();
    _simulatedController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final simulated = _condition == SessionCondition.simulated
        ? double.parse(_simulatedController.text.trim())
        : null;
    widget.onStart(
      SessionLabels(
        subjectCode: _subjectController.text.trim(),
        hand: _hand,
        condition: _condition,
        repetition: int.parse(_repetitionController.text.trim()),
        simulatedFrequencyHz: simulated,
        notes: _notesController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(AppStrings.protocol),
          const SizedBox(height: 16),
          TextFormField(
            controller: _subjectController,
            decoration: const InputDecoration(
              labelText: AppStrings.subjectCode,
            ),
            validator: (value) => (value == null || value.trim().isEmpty)
                ? AppStrings.subjectRequired
                : null,
          ),
          const SizedBox(height: 12),
          Text(AppStrings.hand, style: Theme.of(context).textTheme.labelLarge),
          SegmentedButton<SessionHand>(
            segments: const [
              ButtonSegment(
                value: SessionHand.left,
                label: Text(AppStrings.handLeft),
              ),
              ButtonSegment(
                value: SessionHand.right,
                label: Text(AppStrings.handRight),
              ),
            ],
            selected: {_hand},
            onSelectionChanged: (selection) =>
                setState(() => _hand = selection.first),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<SessionCondition>(
            initialValue: _condition,
            decoration: const InputDecoration(labelText: AppStrings.condition),
            items: const [
              DropdownMenuItem(
                value: SessionCondition.rest,
                child: Text(AppStrings.conditionRest),
              ),
              DropdownMenuItem(
                value: SessionCondition.postural,
                child: Text(AppStrings.conditionPostural),
              ),
              DropdownMenuItem(
                value: SessionCondition.noiseFloor,
                child: Text(AppStrings.conditionNoiseFloor),
              ),
              DropdownMenuItem(
                value: SessionCondition.simulated,
                child: Text(AppStrings.conditionSimulated),
              ),
            ],
            onChanged: (value) =>
                setState(() => _condition = value ?? _condition),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _repetitionController,
            decoration: const InputDecoration(labelText: AppStrings.repetition),
            keyboardType: TextInputType.number,
            validator: (value) {
              final n = int.tryParse(value?.trim() ?? '');
              return (n == null || n < 1) ? AppStrings.repetitionInvalid : null;
            },
          ),
          if (_condition == SessionCondition.simulated) ...[
            const SizedBox(height: 12),
            TextFormField(
              controller: _simulatedController,
              decoration: const InputDecoration(
                labelText: AppStrings.simulatedFrequency,
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              validator: (value) {
                final f = double.tryParse(value?.trim() ?? '');
                return (f == null || f <= 0)
                    ? AppStrings.simulatedFrequencyInvalid
                    : null;
              },
            ),
          ],
          const SizedBox(height: 12),
          TextFormField(
            controller: _notesController,
            decoration: const InputDecoration(labelText: AppStrings.notes),
            maxLines: 2,
          ),
          const SizedBox(height: 24),
          FilledButton(onPressed: _submit, child: const Text(AppStrings.start)),
        ],
      ),
    );
  }
}
