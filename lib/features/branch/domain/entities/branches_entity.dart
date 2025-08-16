import 'package:equatable/equatable.dart';
import 'branch_entity.dart';

class BranchesEntity extends Equatable {
  final List<BranchEntity> branches;

  BranchesEntity({required this.branches});
  @override
  List<Object?> get props => [branches];
}