// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branches_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchesModel _$BranchesModelFromJson(Map<String, dynamic> json) =>
    BranchesModel(
      branches:
          (json['branches'] as List<dynamic>)
              .map((e) => BranchModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$BranchesModelToJson(BranchesModel instance) =>
    <String, dynamic>{'branches': instance.branches};
