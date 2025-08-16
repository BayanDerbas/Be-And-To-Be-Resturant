import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:web_app/features/auth/data/models/logout/logout_model.dart';
import '../../../../../core/networks/api_constant.dart';

part 'logout_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class LogoutService {
  factory LogoutService(Dio dio, {String baseUrl}) = _LogoutService;

  @POST(ApiConstant.logout)
  Future<LogoutModel> logout(@Header("Authorization") String bearerToken);
}
