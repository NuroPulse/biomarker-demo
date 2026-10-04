part of '_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appTitle)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton(
              onPressed: () => context.push('/measure'),
              child: const Text(AppStrings.start),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => context.push('/sessions'),
              child: const Text(AppStrings.savedSessions),
            ),
          ],
        ),
      ),
    );
  }
}
