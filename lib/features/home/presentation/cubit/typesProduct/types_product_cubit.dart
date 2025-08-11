import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/constants/app_images.dart';

part 'types_product_state.dart';

class ProductTypesCubit extends Cubit<ProductTypesState> {
  ProductTypesCubit() : super(ProductTypesInitial());

  final Map<String, List<Map<String, dynamic>>> _productTypes = {
    'مناقيش': [
      {'name': 'زعتر', 'image': AppImages.zaatar, 'price': '10', 'isAvailable': true},
      {'name': 'لحمة', 'image': AppImages.meet, 'price': '15', 'isAvailable': false,'subTypes': ['لحمة حبش', 'لحمة غنم'],},
    ],
    'بيتزا': [
      {'name': 'مارغريتا', 'image': AppImages.zaatar, 'price': '25.000', 'isAvailable': true},
      {'name': 'بيبروني', 'image': AppImages.meet, 'price': '300.000', 'isAvailable': true},
    ],
    'جبنة': [
      {'name': 'عكاوي', 'image': AppImages.zaatar, 'price': '18', 'isAvailable': true},
      {'name': 'موزاريلا', 'image': AppImages.meet, 'price': '22', 'isAvailable': false},
    ],
  };

  void loadTypesForProduct(String productName) {
    final types = _productTypes[productName];
    if (types != null && types.isNotEmpty) {
      emit(ProductTypesLoaded(types: types)); // لا تقوم بالتصفية
    } else {
      emit(const ProductTypesFailure(message: 'لا توجد أنواع لهذا المنتج'));
    }
  }
}
