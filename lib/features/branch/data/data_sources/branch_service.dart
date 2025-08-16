import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:web_app/features/branch/data/models/branches_model.dart';
import '../../../../core/networks/api_constant.dart';

part 'branch_service.g.dart';

@RestApi(baseUrl : ApiConstant.baseUrl)
abstract class BranchService{
  factory BranchService(Dio dio ,{String baseUrl}) = _BranchService;

  @GET(ApiConstant.branch)
  Future<BranchesModel> getBranches();
}