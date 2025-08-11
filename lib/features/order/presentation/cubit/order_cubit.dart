import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit({
    required String name,
    required String image,
    required List<Map<String, dynamic>> types,
  }) : super(OrderState(
    name: name,
    image: image,
    types: types,
    selectedType: null,
    selectedSubType: null,
    quantity: 1,
    unitPrice: int.tryParse(types.isNotEmpty ? types.first['price'].toString() : '0') ?? 0,
    totalPrice: int.tryParse(types.isNotEmpty ? types.first['price'].toString() : '0') ?? 0,
    isAvailable: types.any((type) => type['isAvailable'] == true),
  ));

  void increase() {
    final newQty = state.quantity + 1;
    final extra = state.isSupportedAdded ? 30 : 0;
    emit(state.copyWith(
      quantity: newQty,
      totalPrice: newQty * state.unitPrice + extra,
    ));
  }

  void decrease() {
    if (state.quantity > 1) {
      final newQty = state.quantity - 1;
      final extra = state.isSupportedAdded ? 30 : 0;
      emit(state.copyWith(
        quantity: newQty,
        totalPrice: newQty * state.unitPrice + extra,
      ));
    }
  }

  void selectType(String newType) {
    final selected = state.types.firstWhere(
          (t) => t['name'] == newType,
      orElse: () => {'price': '0', 'subTypes': []},
    );

    final newUnitPrice = int.tryParse(selected['price'].toString()) ?? 0;
    final extra = state.isSupportedAdded ? 30 : 0;

    emit(state.copyWith(
      selectedType: newType,
      selectedSubType: null, // رجع الفرعي لـ null لما نغير النوع الرئيسي
      unitPrice: newUnitPrice,
      totalPrice: newUnitPrice * state.quantity + extra,
    ));
  }

  void selectSubType(String newSubType) {
    emit(state.copyWith(selectedSubType: newSubType));
  }

  void toggleSupport() {
    final added = !state.isSupportedAdded;
    final extra = added ? 30 : -30;
    emit(state.copyWith(
      isSupportedAdded: added,
      totalPrice: state.totalPrice + extra,
    ));
  }

  // دالة تجمع كل الأنواع الفرعية لجميع الأنواع الرئيسية
  List<String> get allSubTypes {
    final List<String> allSubs = [];
    for (var t in state.types) {
      final subs = (t['subTypes'] as List?)?.cast<String>() ?? [];
      allSubs.addAll(subs);
    }
    return allSubs.toSet().toList(); // إزالة التكرار
  }
}
