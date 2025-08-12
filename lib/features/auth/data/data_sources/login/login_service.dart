import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networks/api_constant.dart';
import '../../models/login/login_user_model.dart';

part 'login_service.g.dart';

@RestApi(baseUrl : ApiConstant.baseUrl)
abstract class LoginService {
  factory LoginService(Dio dio ,{String baseUrl}) = _LoginService;
  
  @POST(ApiConstant.login)
  Future<LoginUserModel> login ({
    @Query('password') required String password,
    @Query('phonenumber') required String phonenumber,
});
}