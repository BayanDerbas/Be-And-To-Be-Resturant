import 'package:json_annotation/json_annotation.dart';

part 'main_category_model.g.dart';

@JsonSerializable()
class MainCategoryModel{
  final int id;
  final String name;
  final String image;
  @JsonKey(name: "branch_id")
  final int branch_id;
  final String created_at;
  final String updated_at;

  MainCategoryModel(this.id, this.name, this.image, this.branch_id, this.created_at, this.updated_at);

  factory MainCategoryModel.fromJson(Map<String,dynamic> json) => _$MainCategoryModelFromJson(json);
  Map<String,dynamic> toJson() => _$MainCategoryModelToJson(this);
}

@JsonSerializable()
class MainCategoriesResponse {
  @JsonKey(name : "All Categories")
  final List<MainCategoryModel> allCategories;

  MainCategoriesResponse({required this.allCategories});

  factory MainCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$MainCategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MainCategoriesResponseToJson(this);
}