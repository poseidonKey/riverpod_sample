import 'package:f_riverpod/layout/default_layout.dart';
import 'package:f_riverpod/riverpod/provider.dart';
import 'package:f_riverpod/riverpod/state_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingListProvider);
    print(state);
    return DefaultLayout(
      title: 'Provider Screen',
      actions: [
        PopupMenuButton(
          itemBuilder: (_) => FilterState.values
              .map(
                (e) => PopupMenuItem(
                  value: e,
                  child: Text(e.name),
                ),
              )
              .toList(),
          onSelected: (value) {
            ref.read(filterProvider.notifier).update((state) => value);
          },
        )
      ],
      body: ListView(
        children: state
            .map(
              (e) => CheckboxListTile(
                value: e.hasBought,
                title: Text('${e.name}(${e.quantity})'),
                onChanged: (value) {
                  ref.read(shoppingListNotifierProvider.notifier).toggleTodo(
                        name: e.name,
                      );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
