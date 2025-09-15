part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<MainCategoryEntity>? categories;
  final int selectedIndex;

  const ProductsLoaded({
    required this.categories,
    required this.selectedIndex,
  });

  ProductsLoaded copyWith({
    List<MainCategoryEntity>? categories,
    int? selectedIndex,
  }) {
    return ProductsLoaded(
      categories: categories ?? this.categories,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [categories, selectedIndex];
}

class ProductsFailure extends ProductsState {
  final String message;

  const ProductsFailure({required this.message});

  @override
  List<Object?> get props => [message];
}