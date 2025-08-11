part of 'order_cubit.dart';

class OrderState extends Equatable {
  final String name;
  final String image;
  final List<Map<String, dynamic>> types;
  final String? selectedType;
  final String? selectedSubType;
  final int quantity;
  final int unitPrice;
  final int totalPrice;
  final bool isSupportedAdded;
  final bool isAvailable;

  const OrderState({
    required this.name,
    required this.image,
    required this.types,
    this.selectedType,
    this.selectedSubType,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    this.isSupportedAdded = false,
    required this.isAvailable,
  });

  OrderState copyWith({
    String? name,
    String? image,
    List<Map<String, dynamic>>? types,
    String? selectedType,
    String? selectedSubType,
    int? quantity,
    int? unitPrice,
    int? totalPrice,
    bool? isSupportedAdded,
    bool? isAvailable,
  }) {
    return OrderState(
      name: name ?? this.name,
      image: image ?? this.image,
      types: types ?? this.types,
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
    name,
    image,
    types,
    selectedType,
    selectedSubType,
    quantity,
    unitPrice,
    totalPrice,
    isSupportedAdded,
    isAvailable,
  ];
}
