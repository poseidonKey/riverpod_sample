import 'package:f_riverpod/layout/default_layout.dart';
import 'package:f_riverpod/riverpod/select_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print('build');
    final name = ref.watch(
      selectProvider.select((value) => value.name),
    );
    final spicy = ref.watch(selectProvider.select((value) => value.isSpicy));
    final bought = ref.watch(selectProvider.select((value) => value.hasBought));
    // listen 또한 select 할 수 있음.
    ref.listen<String>(selectProvider.select((value) => value.name),
        (previous, next) {
      print('previous: $previous / next: $next');
    });

    return DefaultLayout(
      title: 'SelectProvider',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'name: $name',
            textAlign: TextAlign.center,
          ),
          Text(
            'isSpicy: $spicy',
            textAlign: TextAlign.center,
          ),
          Text(
            'hasBought: $bought',
            textAlign: TextAlign.center,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // ref.read(selectProvider.notifier).toggleItemName();
                  },
                  child: const Text('Toggle Name'),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(selectProvider.notifier).toggleIsSpicy();
                  },
                  child: const Text('ToggleSpicy'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
