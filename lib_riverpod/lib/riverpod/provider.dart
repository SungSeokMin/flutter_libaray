import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_tutorial/model/shopping_item_model.dart';
import 'package:flutter_state_tutorial/riverpod/state_notifier_provider.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>((ref) {
  final shoppingListState = ref.watch(shoppingListProvider);
  final filterState = ref.watch(filterProvider);

  if (filterState == FilterState.all) return shoppingListState;

  return shoppingListState
      .where((e) => filterState == FilterState.spicy ? e.isSpicy : !e.isSpicy)
      .toList();
});

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
