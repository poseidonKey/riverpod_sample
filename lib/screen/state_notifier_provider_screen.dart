import 'package:f_riverpod/layout/default_layout.dart';
import 'package:f_riverpod/model/shopping_item_model.dart';
import 'package:f_riverpod/riverpod/state_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ShoppingItemModel> items = ref.watch(shoppingListNotifierProvider);

    return DefaultLayout(
      title: 'StateNotifierProvider',
      body: ListView(
        children: items
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
