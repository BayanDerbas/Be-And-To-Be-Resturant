import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:web_app/features/order/data/models/meal_with_types_model.dart';
import '../../../../core/networks/api_constant.dart';

part 'meal_types_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class MealTypesService {
  factory MealTypesService(Dio dio, {String baseUrl}) = _MealTypesService;

  @GET("${ApiConstant.getTypesOfMeals}/{meal_id}")
  Future<HttpResponse<Map<String, dynamic>>> getTypesOfMeal(
      @Path("meal_id") int meal_id,
      );


}

