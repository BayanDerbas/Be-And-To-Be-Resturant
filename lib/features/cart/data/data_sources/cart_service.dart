import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networks/api_constant.dart';
import '../models/add_to_cart_response_model.dart';
import '../models/cart_info_model.dart';
import '../models/update_count_cart_model.dart';

part 'cart_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class CartService {
  factory CartService(Dio dio, {String baseUrl}) = _CartService;

  @POST(ApiConstant.addToCart)
  Future<AddToCartResponseModel> addToCart(
      @Query('type_id') int type_id,
      @Query('amount') int amount,
      @Query('price') int price,
      @Query('extra') int extra,
      @Query('branch_id') int branch_id,
      );

  @GET('${ApiConstant.show_cart}/{branch_id}')
  Future<CartResponseModel> showCart(@Path('branch_id') int branchId);

  @POST(ApiConstant.addone_with_cart)
  Future<List<String>> addOne(@Query('item_id') int itemId);

  @POST(ApiConstant.minusone_with_cart)
  Future<UpdateCountCartModel> minusOne(@Query('item_id') int itemId);
}

