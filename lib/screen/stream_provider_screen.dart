import 'package:f_riverpod/layout/default_layout.dart';
import 'package:f_riverpod/riverpod/stream_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multipleStreamProvider);
    return DefaultLayout(
        title: 'Stream Provider',
        body: Center(
          child: state.when(
            data: (data) {
              return Text(data.toString());
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => const CircularProgressIndicator(),
          ),
        ));
  }
}
