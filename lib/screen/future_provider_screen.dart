import 'package:f_riverpod/layout/default_layout.dart';
import 'package:f_riverpod/riverpod/future_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multiplesFutureProvider);

    return DefaultLayout(
      title: 'Future Provider',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          state.when(
            data: (data) {
              return Text(data.toString());
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => const CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
