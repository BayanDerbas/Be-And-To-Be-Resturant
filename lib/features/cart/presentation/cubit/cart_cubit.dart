import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../widgets/CustomCart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {

  CartCubit()
      : super(const CartState(
    items: [],
    totalPrice: 0,
    minOrderPrice: 50,
  ));

  void selectCoupon(String coupon) {
    emit(state.copyWith(selectedCoupon: coupon));
  }

  void updateTableNumber(String number) {
    emit(state.copyWith(tableNumber: number));
  }

  void updateNote(String note) {
    emit(state.copyWith(note: note));
  }

  void addItem(CartItem item) {
    final existingIndex = state.items.indexWhere((i) =>
    i.name == item.name &&
        i.type == item.type);

    List<CartItem> updatedItems = List.from(state.items);
    if (existingIndex != -1) {
      final existingItem = updatedItems[existingIndex];
      updatedItems[existingIndex] = CartItem(
        id: existingItem.id,
        name: existingItem.name,
        type: existingItem.type,
        image: existingItem.image,
        quantity: existingItem.quantity + item.quantity,
        unitPrice: existingItem.unitPrice,
      );
    } else {
      updatedItems.add(item);
    }

    final newTotal = _calculateTotal(updatedItems);
    emit(state.copyWith(items: updatedItems, totalPrice: newTotal));
  }

  void removeItem(CartItem item) {
    final updatedItems = state.items.where((i) =>
    !(i.name == item.name && i.type == item.type)).toList();

    final newTotal = _calculateTotal(updatedItems);
    emit(state.copyWith(items: updatedItems, totalPrice: newTotal));
  }

  void clearCart() {
    emit(state.copyWith(items: [], totalPrice: 0));
  }

  void increaseQuantity(CartItem item) {
    final index = state.items.indexWhere((i) =>
    i.name == item.name && i.type == item.type);

    if (index != -1) {
      final updatedItems = List<CartItem>.from(state.items);
      final existing = updatedItems[index];
      updatedItems[index] = CartItem(
        id: existing.id,
        name: existing.name,
        type: existing.type,
        image: existing.image,
        quantity: existing.quantity + 1,
        unitPrice: existing.unitPrice,
      );

      final newTotal = _calculateTotal(updatedItems);
      emit(state.copyWith(items: updatedItems, totalPrice: newTotal));
    }
  }

  void decreaseOrRemoveItem(CartItem item) {
    final index = state.items.indexWhere((i) =>
    i.name == item.name && i.type == item.type);

    if (index != -1) {
      final updatedItems = List<CartItem>.from(state.items);
      final existing = updatedItems[index];

      if (existing.quantity > 1) {
        updatedItems[index] = CartItem(
          id: existing.id,
          name: existing.name,
          type: existing.type,
          image: existing.image,
          quantity: existing.quantity - 1,
          unitPrice: existing.unitPrice,
        );
      } else {
        updatedItems.removeAt(index);
      }

      final newTotal = _calculateTotal(updatedItems);
      emit(state.copyWith(items: updatedItems, totalPrice: newTotal));
    }
  }

  int _calculateTotal(List<CartItem> items) {
    return items.fold(0, (sum, i) => sum + i.quantity * i.unitPrice);
  }
}