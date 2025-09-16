import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:web_app/features/home/data/models/meals_response.dart';
import '../../../../core/networks/api_constant.dart';

part 'meal_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class MealService {
  factory MealService(Dio dio ,{String baseUrl}) = _MealService;

  @GET('${ApiConstant.getMeals}/{maincategory_id}')
  Future<HttpResponse<MealsResponse>> getMealsOfCategory(
      @Path("maincategory_id") int maincategory_id,
      );
}