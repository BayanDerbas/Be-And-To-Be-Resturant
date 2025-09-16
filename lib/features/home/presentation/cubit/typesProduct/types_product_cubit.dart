import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:web_app/features/home/domain/repositories/meal_repository.dart';
import 'package:web_app/features/home/domain/usecases/get_meals_of_category_usecase.dart';
import '../../../../../core/constants/app_images.dart';

part 'types_product_state.dart';

class ProductTypesCubit extends Cubit<ProductTypesState> {
  final GetMealOfCategoryUseCase getMealOfCategoryUseCase;
  ProductTypesCubit(this.getMealOfCategoryUseCase) : super(ProductTypesInitial());

  Future<void> loadTypesForProduct(int maincategory_id) async {
    emit(ProductTypesLoading());
    final result = await getMealOfCategoryUseCase(maincategory_id);
    result.fold(
            (failure){
              emit(ProductTypesFailure(message: failure.message));
            },
            (meals){
              final types = meals.map((meal) => {
                'id': meal.id,
                'name': meal.name,
                'image': meal.image,
                'description': meal.description,
              }).toList();
              if (types.isEmpty){
                emit(ProductTypesFailure(message: "لا يوجد أنواع وجبات لهذا المنتج"));
              } else {
                emit(ProductTypesLoaded(types: types));
              }
            },
    );
  }
}
