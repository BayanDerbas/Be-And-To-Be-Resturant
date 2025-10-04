import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:web_app/features/order/domain/entities/meal_with_types_entity.dart';
import '../../domain/entities/meal_type_entity.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(MealWithTypesEntity meal)
      : super(OrderState(
    meal: meal,
    selectedType: meal.types?.isNotEmpty == true ? meal.types!.first.name : null,
    selectedSubType: null,
    quantity: 1,
    unitPrice: meal.types?.isNotEmpty == true ? (meal.types!.first.price) : 0,
    totalPrice: meal.types?.isNotEmpty == true ? (meal.types!.first.price) : 0,
    isSupportedAdded: false,
    isAvailable: meal.types?.any((t) => t.available == 1) ?? false,
  ));

  void updateMeal(MealWithTypesEntity meal) {
    emit(state.copyWith(
      meal: meal,
      selectedType: meal.types?.isNotEmpty == true ? meal.types!.first.name : null,
      selectedSubType: null,
      quantity: 1,
      unitPrice: meal.types?.isNotEmpty == true ? (meal.types!.first.price) : 0,
      totalPrice: meal.types?.isNotEmpty == true ? (meal.types!.first.price) : 0,
      isSupportedAdded: false,
      isAvailable: meal.types?.any((t) => t.available == 1) ?? false,
    ));
  }

  void increase() {
    final newQty = state.quantity + 1;
    emit(state.copyWith(
      quantity: newQty,
      totalPrice: newQty * state.unitPrice,
    ));
  }

  void decrease() {
    if (state.quantity > 1) {
      final newQty = state.quantity - 1;
      emit(state.copyWith(
        quantity: newQty,
        totalPrice: newQty * state.unitPrice,
      ));
    }
  }

  void selectType(String newType) {
    final List<MealTypeEntity> types = (state.meal.types ?? []).cast<MealTypeEntity>();
    MealTypeEntity? selected;
    if (types.isNotEmpty) {
      final matches = types.where((t) => t.name == newType);
      selected = matches.isNotEmpty ? matches.first : types.first;
    }

    final bool supportAvailableForType = (selected?.supportprice ?? 0) > 0;
    final bool useSupport = state.isSupportedAdded && supportAvailableForType;
    final int newUnitPrice = useSupport ? (selected?.supportprice ?? 0) : (selected?.price ?? 0);

    final bool nextIsSupported = supportAvailableForType ? state.isSupportedAdded : false;

    emit(state.copyWith(
      selectedType: newType,
      selectedSubType: null,
      unitPrice: newUnitPrice,
      totalPrice: newUnitPrice * state.quantity,
      isSupportedAdded: nextIsSupported,
    ));
  }

  void selectSubType(String newSubType) {
    emit(state.copyWith(selectedSubType: newSubType));
  }

  void toggleSupport() {
    final List<MealTypeEntity> types = (state.meal.types ?? []).cast<MealTypeEntity>();
    if (types.isEmpty) return;
    final MealTypeEntity? selected = types.firstWhere(
      (t) => t.name == state.selectedType,
      orElse: () => types.first,
    );
    final bool supportAvailableForType = (selected?.supportprice ?? 0) > 0;
    if (!supportAvailableForType) {
      return;
    }

    final bool added = !state.isSupportedAdded;
    final int newUnitPrice = added ? (selected?.supportprice ?? 0) : (selected?.price ?? 0);
    emit(state.copyWith(
      isSupportedAdded: added,
      unitPrice: newUnitPrice,
      totalPrice: newUnitPrice * state.quantity,
    ));
  }

  bool get supportAvailable {
    final List<MealTypeEntity> types = (state.meal.types ?? []).cast<MealTypeEntity>();
    if (types.isEmpty) return false;
    final MealTypeEntity? selected = types.firstWhere(
      (t) => t.name == state.selectedType,
      orElse: () => types.first,
    );
    return (selected?.supportprice ?? 0) > 0;
  }

  List<String> get allSubTypes {
    return const [];
  }
}
