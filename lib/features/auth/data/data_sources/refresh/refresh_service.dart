import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networks/api_constant.dart';
import '../../models/refresh/refresh_model.dart';

part 'refresh_service.g.dart';

@RestApi(baseUrl : ApiConstant.baseUrl)
abstract class RefreshService{
  factory RefreshService(Dio dio ,{String? baseUrl}) = _RefreshService;

  @POST(ApiConstant.refresh)
  Future<RefreshModel> refresh(@Header("Authorization") String bearerToken);
}