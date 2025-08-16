import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/branches_entity.dart';
import 'branch_model.dart';

part 'branches_model.g.dart';

@JsonSerializable()
class BranchesModel extends BranchesEntity {
  final List<BranchModel> branches;

  BranchesModel({required this.branches})
      : super(branches: branches);

  factory BranchesModel.fromJson(Map<String, dynamic> json) =>
      _$BranchesModelFromJson(json);

  Map<String, dynamic> toJson() => _$BranchesModelToJson(this);

  @override
  List<Object?> get props => [branches];
}
