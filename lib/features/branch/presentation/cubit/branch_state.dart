part of 'branch_cubit.dart';

abstract class BranchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BranchInitial extends BranchState {}

class BranchLoaded extends BranchState {
  final List<BranchModel> branches;

   BranchLoaded(this.branches);

  @override
  List<Object?> get props => [branches];
}

class BranchSelected extends BranchState {
  final BranchModel branch;

   BranchSelected(this.branch);

  @override
  List<Object?> get props => [branch];
}