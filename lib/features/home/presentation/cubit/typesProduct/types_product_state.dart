part of 'types_product_cubit.dart';

abstract class ProductTypesState extends Equatable {
  const ProductTypesState();

  List<Object?> get props => [];
}

class ProductTypesInitial extends ProductTypesState {}
class ProductTypesLoading extends ProductTypesState {}
class ProductTypesLoaded extends ProductTypesState {
  final List<Map<String, dynamic>> types;

  const ProductTypesLoaded({required this.types});

  @override
  List<Object> get props => [types];
}

class ProductTypesFailure extends ProductTypesState {
  final String message;

  const ProductTypesFailure({required this.message});

  @override
  List<Object?> get props => [message];
}