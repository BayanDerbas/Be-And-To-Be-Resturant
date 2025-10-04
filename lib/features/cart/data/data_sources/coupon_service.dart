import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:web_app/features/cart/data/models/coupon_model.dart';
import '../../../../core/networks/api_constant.dart';

part 'coupon_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class CouponService {
  factory CouponService(Dio dio,{String baseUrl}) = _CouponService;

  @GET('${ApiConstant.show_coupons}/{branch_id}')
  Future<CouponModel> getAllCoupon({
    @Path('branch_id') required int branch_id,
});
}