import 'dart:convert';

import 'package:biomarker_demo/features/sessions/data/models/_models.dart';
import 'package:biomarker_demo/features/sessions/domain/entity/session_condition.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/session_fixtures.dart';

void main() {
  test('round-trips an entity through the model without losing fields', () {
    final original = sessionFixture();

    final restored = SessionModel.fromEntity(original).toEntity();

    expect(restored.id, original.id);
    expect(restored.createdAt, original.createdAt);
    expect(restored.subjectCode, original.subjectCode);
    expect(restored.hand, original.hand);
    expect(restored.condition, original.condition);
    expect(restored.repetition, original.repetition);
    expect(restored.notes, original.notes);
    expect(restored.device.model, original.device.model);
    expect(restored.sampling.effectiveFsHz, original.sampling.effectiveFsHz);
    expect(restored.result.status, original.result.status);
    expect(restored.result.features!.snr, original.result.features!.snr);
    expect(
      restored.result.gates.map((g) => g.check),
      original.result.gates.map((g) => g.check),
    );
  });

  test('survives a JSON encode and decode', () {
    final model = SessionModel.fromEntity(sessionFixture());

    final json = jsonDecode(jsonEncode(model.toJson())) as Map<String, dynamic>;
    final decoded = SessionModel.fromJson(json);

    expect(decoded, model);
  });

  test('uses the meta.json wire names from CLAUDE.md section 6', () {
    final json = SessionModel.fromEntity(sessionFixture()).toJson();

    expect(json['sessionId'], 'session-1');
    expect(json['condition'], 'noise_floor');
    expect((json['sampling'] as Map)['requestedPeriodUs'], 10000);
    expect((json['result'] as Map)['status'], 'tremor');
  });

  test('stores createdAt as UTC ISO-8601', () {
    final json = SessionModel.fromEntity(sessionFixture()).toJson();

    expect(json['createdAt'], '2026-10-03T03:15:00.000Z');
  });

  test('maps every condition to its wire name and back', () {
    for (final condition in SessionCondition.values) {
      final model = SessionModel.fromEntity(
        sessionFixture(condition: condition),
      );
      expect(model.toEntity().condition, condition);
    }
  });
}
