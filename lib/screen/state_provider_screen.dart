import 'package:f_riverpod/layout/default_layout.dart';
import 'package:f_riverpod/riverpod/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
      title: 'Basic Provider',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            provider.toString(),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(numberProvider.notifier).state =
                  ref.read(numberProvider.notifier).state + 1;
            },
            child: const Text(
              'UP',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(numberProvider.notifier).update((state) => state + 1);
            },
            child: const Text('다른 방법'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const _NextScreen(),
                ),
              );
            },
            child: const Text('Next Screen'),
          ),
        ],
      ),
    );
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);
    return DefaultLayout(
      title: '_Next Screen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            provider.toString(),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(numberProvider.notifier).state =
                  ref.read(numberProvider.notifier).state + 1;
            },
            child: const Text(
              'UP',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Previous Screen'),
          ),
        ],
      ),
    );
  }
}
