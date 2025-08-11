import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  final List<Map<String, String>> _allProducts = [
    {'image': 'assets/images/pizza.png', 'name': 'بيتزا'},
    {'image': 'assets/images/donut.png', 'name': 'مناقيش'},
    {'image': 'assets/images/pizza.png', 'name': 'جبنة'},
  ];

  void loadProducts() {
    emit(ProductsLoading());
    try {
      emit(ProductsLoaded(selectedIndex: 0, products: _allProducts));
    } catch (e) {
      emit(const ProductsFailure(message: 'فشل تحميل المنتجات'));
    }
  }

  void changeSelectedIndex(int index) {
    final current = state;
    if (current is ProductsLoaded) {
      emit(current.copyWith(selectedIndex: index));
    }
  }
}