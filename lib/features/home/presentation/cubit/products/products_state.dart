part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Map<String, String>> products;
  final int selectedIndex;

  const ProductsLoaded({
    required this.products,
    required this.selectedIndex,
  });

  ProductsLoaded copyWith({
    List<Map<String, String>>? products,
    int? selectedIndex,
  }) {
    return ProductsLoaded(
      products: products ?? this.products,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [products, selectedIndex];
}

class ProductsFailure extends ProductsState {
  final String message;

  const ProductsFailure({required this.message});

  @override
  List<Object?> get props => [message];
}