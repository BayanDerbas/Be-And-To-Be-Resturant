part of 'branch_cubit.dart';

abstract class BranchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BranchInitial extends BranchState {}
class BranchLoading extends BranchState {}
class BranchSuccess extends BranchState {
  final BranchesEntity branches;
  BranchSuccess(this.branches);
  @override
  List<Object?> get props => [branches];
}
class BranchesFailure extends BranchState {
  final String? message;
  BranchesFailure(this.message);
  @override
  List<Object?> get props => [message];
}
class BranchSelected extends BranchState {
  final BranchEntity branch;
  BranchSelected(this.branch);
  @override
  List<Object?> get props => [branch];
}