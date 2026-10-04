import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/strings/app_strings.dart';
import '../../../../core/utils/_utils.dart';
import '../../domain/entity/session_entity.dart';
import '../cubit/_cubits.dart';
import '../widgets/_widgets.dart';

/// Saved sessions, newest first. Delete asks for confirmation (CLAUDE.md
/// section 9).
class SessionsPage extends StatelessWidget {
  const SessionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.savedSessions)),
      body: BlocConsumer<SessionsCubit, SessionsState>(
        listener: (context, state) {
          if (state is SessionsLoaded && state.actionFailure != null) {
            final message = AppStrings.failure(state.actionFailure!);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
            context.read<SessionsCubit>().clearActionFailure();
          }
        },
        builder: (context, state) => switch (state) {
          SessionsLoading() => const Center(child: CircularProgressIndicator()),
          SessionsFailure(:final failure) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppStrings.failure(failure), textAlign: TextAlign.center),
                TextButton(
                  onPressed: () => context.read<SessionsCubit>().load(),
                  child: const Text(AppStrings.retry),
                ),
              ],
            ),
          ),
          SessionsLoaded(:final sessions) =>
            sessions.isEmpty
                ? const Center(child: Text(AppStrings.noSessions))
                : ListView.separated(
                    itemCount: sessions.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (context, index) =>
                        _SessionTile(session: sessions[index]),
                  ),
        },
      ),
    );
  }
}

class _SessionTile extends StatelessWidget {
  const _SessionTile({required this.session});

  final SessionEntity session;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SessionsCubit>();
    return ListTile(
      title: Text(
        '${session.subjectCode} · ${SessionTexts.condition(session.condition)}',
      ),
      subtitle: Text(
        '${formatLocalDateTime(session.createdAt)} · '
        '${SessionTexts.decision(session.result.status)}',
      ),
      onTap: () => context.push('/sessions/${session.id}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            tooltip: AppStrings.export,
            icon: const Icon(Icons.share),
            onPressed: () => cubit.share(session.id),
          ),
          IconButton(
            tooltip: AppStrings.delete,
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _confirmDelete(context, cubit),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, SessionsCubit cubit) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text(AppStrings.deleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(AppStrings.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(AppStrings.delete),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await cubit.delete(session.id);
    }
  }
}
