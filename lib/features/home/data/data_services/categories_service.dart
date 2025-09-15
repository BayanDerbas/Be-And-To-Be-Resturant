import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:web_app/features/home/data/models/main_category_model.dart';
import '../../../../core/networks/api_constant.dart';

part 'categories_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class CategoriesService {
  factory CategoriesService(Dio dio,{String baseUrl}) = _CategoriesService;

@GET('${ApiConstant.categories}/{branch_id}')
  Future<HttpResponse<MainCategoriesResponse>> getCategories(@Path("branch_id") int branch_id);
}