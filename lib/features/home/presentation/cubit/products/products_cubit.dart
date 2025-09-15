import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:web_app/features/home/domain/entites/main_category_entity.dart';
import 'package:web_app/features/home/domain/usecases/get_main_categories_usecase.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetMainCategoriesUseCase getMainCategoriesUseCase ;
  ProductsCubit(this.getMainCategoriesUseCase) : super(ProductsInitial());

  Future<void> loadProducts(int branch_id) async{
    emit(ProductsLoading());
    try {
      final result = await getMainCategoriesUseCase(branch_id);
      result.fold(
              (failure){
                emit(ProductsFailure(message: failure.message));
              },
          (categories){
            emit(ProductsLoaded(selectedIndex: 0, categories: categories));
          },
      );
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