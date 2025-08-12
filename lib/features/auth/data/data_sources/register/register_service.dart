import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../../../core/networks/api_constant.dart';
import '../../models/register/register_user_model.dart';

part 'register_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RegisterService {
  factory RegisterService(Dio dio, {String baseUrl}) = _RegisterService;

  @POST(ApiConstant.register)
  Future<RegisterUserModel> register({
    @Query('fullname') required String fullname,
    @Query('phonenumber') required String phonenumber,
    @Query('password') required String password,
  });
}
