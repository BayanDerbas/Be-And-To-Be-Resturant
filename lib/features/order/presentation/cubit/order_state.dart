part of 'order_cubit.dart';

class OrderState extends Equatable {
  final MealWithTypesEntity meal;
  final String? selectedType;
  final String? selectedSubType;
  final int quantity;
  final int unitPrice;
  final int totalPrice;
  final bool isSupportedAdded;
  final bool isAvailable;

  const OrderState({
    required this.meal,
    this.selectedType,
    this.selectedSubType,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    this.isSupportedAdded = false,
    required this.isAvailable,
  });

  OrderState copyWith({
    MealWithTypesEntity? meal,
    String? selectedType,
    String? selectedSubType,
    int? quantity,
    int? unitPrice,
    int? totalPrice,
    bool? isSupportedAdded,
    bool? isAvailable,
  }) {
    return OrderState(
      meal: meal ?? this.meal,
      selectedType: selectedType ?? this.selectedType,
      selectedSubType: selectedSubType ?? this.selectedSubType,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      totalPrice: totalPrice ?? this.totalPrice,
      isSupportedAdded: isSupportedAdded ?? this.isSupportedAdded,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  @override
  List<Object?> get props => [
    meal,
    selectedType,
    selectedSubType,
    quantity,
    unitPrice,
    totalPrice,
    isSupportedAdded,
    isAvailable,
  ];
}