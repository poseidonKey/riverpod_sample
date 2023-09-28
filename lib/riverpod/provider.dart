import 'package:f_riverpod/model/shopping_item_model.dart';
import 'package:f_riverpod/riverpod/state_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>((ref) {
  final shoppingListState = ref.watch(shoppingListNotifierProvider);
  final filterState = ref.watch(filterProvider);
  if (filterState == FilterState.all) return shoppingListState;
  return shoppingListState
      .where((element) =>
          filterState == FilterState.spicy ? element.isSpicy : !element.isSpicy)
      .toList();
});

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider((ref) => FilterState.all);
