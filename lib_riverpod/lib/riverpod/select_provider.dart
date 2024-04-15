import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_tutorial/model/shopping_item_model.dart';

final selectProvider = StateNotifierProvider<SelectProvider, ShoppingItemModel>(
  (ref) => SelectProvider(),
);

class SelectProvider extends StateNotifier<ShoppingItemModel> {
  SelectProvider()
      : super(
          ShoppingItemModel(
            name: '김치',
            quantity: 3,
            hasBought: false,
            isSpicy: true,
          ),
        );

  toggleHasBought() {
    state = state.copyWith(
      hasBought: !state.hasBought,
    );
  }

  toggleIsSpicy() {
    state = state.copyWith(
      isSpicy: !state.isSpicy,
    );
  }
}
