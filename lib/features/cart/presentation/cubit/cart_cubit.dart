import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:web_app/features/cart/domain/entities/add_to_cart_response_entity.dart';
import 'package:web_app/features/cart/domain/entities/cart_info_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/usecases/cart_info_usecase.dart';
import '../widgets/CustomCart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository repository;
  final CartInfoUseCase usecase;

  CartCubit(this.repository, this.usecase)
    : super(CartInitial(items: [], totalPrice: 0, minOrderPrice: 50));

  Future<void> addToCartApi({
    required int typeId,
    required int amount,
    required int price,
    required int extra,
    required int branchId,
    CartItem? itemToAdd,
  }) async {
    emit(CartLoading());
    final result = await repository.addToCart(
      type_id: typeId,
      amount: amount,
      price: price,
      extra: extra,
      branch_id: branchId,
    );

    result.fold((failure) => emit(CartError(failure.message)), (entity) {
      if (itemToAdd != null) {
        addItem(itemToAdd);
      }
      emit(CartSuccess(entity));
    });
  }

  Future<void> fetchCartInfo({required int branch_id}) async {
    emit(CartLoading());
    final result = await usecase.call(branch_id);
    result.fold(
      (failure) {
        emit(CartError(failure.message));
        print("Error Cart Info Cubit : ${failure.message}");
      },
      (list) => emit(CartInfoSuccess(list)),
    );
  }

  void selectCoupon(String coupon) {
    if (state is CartInitial) {
      emit((state as CartInitial).copyWith(selectedCoupon: coupon));
    }
  }

  void updateTableNumber(String number) {
    if (state is CartInitial) {
      emit((state as CartInitial).copyWith(tableNumber: number));
    }
  }

  void updateNote(String note) {
    if (state is CartInitial) {
      emit((state as CartInitial).copyWith(note: note));
    }
  }

  Future<void> addItem(CartItem item) async{
    if (state is! CartInitial) return;

    final currentState = state as CartInitial;
    final existingIndex = currentState.items.indexWhere(
      (i) => i.name == item.name && i.type == item.type,
    );

    List<CartItem> updatedItems = List.from(currentState.items);
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
    emit(currentState.copyWith(items: updatedItems, totalPrice: newTotal));
  }

  Future<void> removeItem(CartItem item) async{
    if (state is! CartInitial) return;

    final currentState = state as CartInitial;
    final updatedItems =
        currentState.items
            .where((i) => !(i.name == item.name && i.type == item.type))
            .toList();

    final newTotal = _calculateTotal(updatedItems);
    emit(currentState.copyWith(items: updatedItems, totalPrice: newTotal));
  }

  void clearCart() {
    if (state is CartInitial) {
      emit((state as CartInitial).copyWith(items: [], totalPrice: 0));
    }
  }

  Future<void> increaseQuantity(CartItem item) async{
    if (state is! CartInitial) return;

    final currentState = state as CartInitial;
    final index = currentState.items.indexWhere(
      (i) => i.name == item.name && i.type == item.type,
    );

    if (index != -1) {
      final updatedItems = List<CartItem>.from(currentState.items);
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
      emit(currentState.copyWith(items: updatedItems, totalPrice: newTotal));
    }
  }

  Future<void> decreaseOrRemoveItem(CartItem item) async{
    if (state is! CartInitial) return;

    final currentState = state as CartInitial;
    final index = currentState.items.indexWhere(
      (i) => i.name == item.name && i.type == item.type,
    );

    if (index != -1) {
      final updatedItems = List<CartItem>.from(currentState.items);
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
      emit(currentState.copyWith(items: updatedItems, totalPrice: newTotal));
    }
  }

  int _calculateTotal(List<CartItem> items) {
    return items.fold(0, (sum, i) => sum + i.quantity * i.unitPrice);
  }
}
